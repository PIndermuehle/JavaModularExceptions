package ModularException;

public interface AspectRestorable {

	/*
	 * Must return true if the data of the object is in an invalid state
	 */
	boolean isCorrupt();

	/*
	 * Must change the objects data from an invalid state to a valid one
	 */
	void fixCorruption();

}
