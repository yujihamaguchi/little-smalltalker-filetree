import java.util.Calendar;
import java.util.GregorianCalendar;

public class Date extends GregorianCalendar {
	private static final long serialVersionUID = 2317114430827648749L;

	public static boolean IsBetween(Calendar theDate, Calendar startDate, Calendar endDate) {
		if (0 <= theDate.compareTo(startDate) && theDate.compareTo(endDate) <= 0) {
			return true;
		}
		return false;
	}
}
