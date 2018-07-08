package ModularException;

import java.util.ArrayList;

/*
 * This aspect allows objects to be returned to their pre-operation state in
 * case of an exception.
 * To use it enter the method in the 'affectedByRollback' pointcut.
 * and throw a BackrollableException with the objects to rollback in the method.
 * The objects must implement the 'AspectBackrollable' interface.
 * The Exception must be cought, but the catch block can be empty.
 * 
 */
public aspect RollbackAspect {

	boolean logActivity = true;

	/*
	 * Include all methods here where a rollbackpoint of the target should be
	 * made before the method begins
	 */
	pointcut targetAffectedByRollback():
		call(* TestSubjects.RollbackTester.setValues(..))
	;

	/*
	 * Include all methods here where a rollbackpoint of the parameter 1 should
	 * be made before the method begins
	 */
	pointcut parameter1AffectedByRollback():
		call(* TestSubjects.RollbackTester.manipulateRollbackTester(..))
	;

	/*
	 * This pointcut gets the target data for the advice
	 */
	pointcut makeRollbackSavepointOfReceiver(AspectBackrollable target):
		targetAffectedByRollback()
		&& target(target)
		;

	/*
	 * This pointcut gets the parameter 1 data for the advice
	 */
	pointcut makeRollbackSavepointOfParameter1(AspectBackrollable parameter1):
		parameter1AffectedByRollback()
		&& args(parameter1,..)
		;

	/*
	 * This pointcut combines all the pointcuts into one
	 */
	pointcut makeRollbackSavepoint(AspectBackrollable target):
		makeRollbackSavepointOfReceiver(target)
		|| 
		makeRollbackSavepointOfParameter1(target)
		;

	/*
	 * This advice causes the selected object to create a rollback point
	 */
	before(AspectBackrollable backrollable) : makeRollbackSavepoint(backrollable){

		backrollable.makeRollbackPoint();

		if (logActivity) {
			System.out
					.println("RollbackAspect is making a RollbackPoint of object "
							+ backrollable);
		}

	}

	pointcut rollBackToBeforeState(BackrollableException exception):
		!call(void java.io.PrintStream.*(..))
		&& handler(BackrollableException)
		&& args(exception)
		;

	/*
	 * This advice takes all the objects from the exception and rolls them back
	 * to their previous state
	 */
	before(BackrollableException exception) : rollBackToBeforeState(exception){

		AspectBackrollable[] rollbackables = exception.getBackrollables();

		for (AspectBackrollable item : rollbackables) {
			if (logActivity) {
				System.out.println("Rolling back the receiver object: " + item);
			}

			item.rollbackToLastPoint();

			if (logActivity) {
				System.out.println("Object is rolled back to: " + item);
			}
		}

	}

}
