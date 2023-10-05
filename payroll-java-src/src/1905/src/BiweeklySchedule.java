import java.util.Calendar;
import java.util.GregorianCalendar;

public class BiweeklySchedule implements PaymentSchedule {
	private final Calendar FIRST_PAYABLE_FRIDAY = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);

	public boolean IsPayDate(Calendar payDate) {
		Calendar cal = Calendar.getInstance();
		if ((payDate.get(Calendar.DAY_OF_WEEK) == Calendar.FRIDAY)) {
			cal.setTime(FIRST_PAYABLE_FRIDAY.getTime());
			while (cal.compareTo(payDate) <= 0) {
				if (cal.equals(payDate)) {
					return true;
				}
				cal.add(Calendar.DATE, 14);
			}
		}
		return false;
	}

	public Calendar GetPayPeriodStartDate(Calendar payDate) {
		Calendar payPeriodStartDate = Calendar.getInstance();
		payPeriodStartDate.setTime(payDate.getTime());
		payPeriodStartDate.add(Calendar.DATE, -13);
		return payPeriodStartDate;
	}
}
