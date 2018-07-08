package ModularException;

import java.util.ArrayList;

/*
 * An Exception that is thrown if certain objects
 * must be rolled back to a save state as a part
 * of the exception handling
 */
public class BackrollableException extends Exception {

	AspectBackrollable[] backrollables = {};

	public BackrollableException(Object[] backrollables) {

		ArrayList<AspectBackrollable> rollbackableList = new ArrayList<AspectBackrollable>();

		for (Object item : backrollables) {
			try {
				rollbackableList.add((AspectBackrollable) item);
			} catch (ClassCastException e) {
				System.out
						.println("The object of type "
								+ item.getClass()
								+ " does not implement the interface 'AspectBackrollable'");
			}
		}

		this.backrollables = rollbackableList.toArray(this.backrollables);
	}

	AspectBackrollable[] getBackrollables() {
		return backrollables;
	}

}
