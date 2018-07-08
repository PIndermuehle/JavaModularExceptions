package ModularException;

import java.util.ArrayList;

public class RestorableException extends Exception {

	AspectRestorable[] restorables = {};

	public RestorableException(Object[] restorables) {

		ArrayList<AspectRestorable> restorableList = new ArrayList<AspectRestorable>();

		
		for (Object item : restorables) {
			try {
				restorableList.add((AspectRestorable) item);
			} catch (ClassCastException e) {
				System.out
						.println("The object of type "
								+ item.getClass()
								+ " does not implement the interface 'AspectRestorable'");
			}
		}

		this.restorables = restorableList.toArray(this.restorables);

	}

	AspectRestorable[] getBackrollables() {
		return restorables;
	}

}
