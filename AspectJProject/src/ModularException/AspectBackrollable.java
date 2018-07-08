package ModularException;

public interface AspectBackrollable {

	/*
	 * Must make the object store its current state so that it can be rolled
	 * back to it once rollbackToLastPoint() is called
	 */
	void makeRollbackPoint();

	/*
	 * Must make the object roll back to the state it had when
	 * makeRollbackPoint() was called
	 */
	void rollbackToLastPoint();

}
