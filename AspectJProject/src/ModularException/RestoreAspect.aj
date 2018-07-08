package ModularException;

import TestSubjects.*;

public aspect RestoreAspect {

	/*
	 * Include all methods where you want the class to check the validity of an
	 * instance object. Classes must implement the "AspectRestorable" interface
	 */

	boolean logActivity = true;

	/*
	 * Include all methods here where you wish the target of the method to be
	 * tested for corrupt data
	 */
	pointcut restoreCorruptionOnTarget():
			call(* TestSubjects.RestoreTester.setValue(..))
			|| call(* TestSubjects.RestoreTester.getValue(..))
		;

	/*
	 * Include all methods here where you wish the parameter 1 of the method to
	 * be tested for corrupt data
	 */
	pointcut restoreCorruptionOnParameter1():
		call(* TestSubjects.RestoreTester.copyValue(RestoreTester))
	;

	/*
	 * Filters out the printclass and gets the target data for the advice
	 */
	pointcut filteredRestoreCorruptionOnTarget(AspectRestorable target):
		!call(void java.io.PrintStream.*(..))
		&& restoreCorruptionOnTarget()
		&& target(target)
		;

	/*
	 * Filters out the printclass and gets the parameter 1 data for the advice
	 */
	pointcut filteredRestoreCorruptionOnParameter1(AspectRestorable parameter1):
		!call(void java.io.PrintStream.*(..))
		&& restoreCorruptionOnParameter1()
		&& args(parameter1)
		;

	/*
	 * Combines the different pointcuts into one
	 */
	pointcut restoreCorruption(AspectRestorable subject):
		filteredRestoreCorruptionOnTarget(subject)
		||
		filteredRestoreCorruptionOnParameter1(subject)
		;

	/*
	 * Checks the viability of the object before the method calls described in
	 * the pointcuts
	 */
	before(AspectRestorable target): restoreCorruption(target){
		if (logActivity)
			System.out.println("Restore aspect is checking the "
					+ "viability of the object " + target
					+ " before a method call");
		if (target.isCorrupt()) {
			if (logActivity)
				System.out.println("The object " + target + " is "
						+ "corrupt, attempting to retore it");
			target.fixCorruption();
		}

	}

	/*
	 * Checks the viability of the object after the method calls described in
	 * the pointcuts
	 */
	after(AspectRestorable target): restoreCorruption(target){
		if (logActivity)
			System.out.println("Restore aspect is checking the "
					+ "viability of the object " + target
					+ " after a method call");
		if (target.isCorrupt()) {
			if (logActivity)
				System.out.println("The object " + target + " is "
						+ "corrupt, attempting to retore it");
			target.fixCorruption();
		}

	}
	
	/*
	 * This pointcut triggers whenever a RestorableException is caught
	 */
	
	pointcut catchRestorableException(RestorableException exception):
		!call(void java.io.PrintStream.*(..))
		&& handler(RestorableException)
		&& args(exception)
		;

	/*
	 * This advice takes all the objects from the exception and attempts
	 * to restore them
	 */
	before(RestorableException exception) : catchRestorableException(exception){

		AspectRestorable[] restorables = exception.getBackrollables();

		for (AspectRestorable item : restorables) {
			if (logActivity) {
				System.out.println("Restoring the receiver object: " + item);
			}

			item.fixCorruption();

			if (logActivity) {
				System.out.println("Object is restored back to: " + item);
			}
		}

	}

}
