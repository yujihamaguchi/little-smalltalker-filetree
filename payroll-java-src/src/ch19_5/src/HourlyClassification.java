import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class HourlyClassification implements PaymentClassification {
	private Map<Calendar, TimeCard> itsTimeCards;
	private double itsHourlyRate;

	public HourlyClassification(double hourlyRate) {
		itsTimeCards = new HashMap<Calendar, TimeCard>();
		itsHourlyRate = hourlyRate;
	}

	public double GetRate() {
		return itsHourlyRate;
	}

	public TimeCard GetTimeCard(Calendar date) {
		return itsTimeCards.get(date);
	}

	public void AddTimeCard(TimeCard tc) {
		itsTimeCards.put(tc.GetDate(), tc);
	}

	/*
	// The following method is used with List 19-32.
	// You don't use this method after Date.IsBetween() method is available in List 19-40.

	public boolean IsInPayPeriod(TimeCard tc, Calendar payPeriod) {
		Calendar timeCardDate = tc.GetDate();
		Calendar payPeriodEndDate = (Calendar) payPeriod.clone();
		Calendar payPeriodStartDate = (Calendar) payPeriod.clone();
		payPeriodStartDate.add(Calendar.DATE, -5);
		if (0 <= timeCardDate.compareTo(payPeriodStartDate)
				&& timeCardDate.compareTo(payPeriodEndDate) <= 0) {
			return true;
		}
		return false;
	}
	*/

	public double CalculatePay(Paycheck pc) {
		double totalPay = 0;
		for (TimeCard tc : itsTimeCards.values()) {
			//if (IsInPayPeriod(tc, pc.GetPayDate())) { // This line used with List 19-32. ( You need to modify Paycheck.java, too. )
			//if (IsInPayPeriod(tc.GetDate(), pc)) { // This line used with List 19-36. ( You need to modify PaymentClassification.java, too. )
			if (Date.IsBetween(tc.GetDate(), pc.GetPayPeriodStartDate(), pc.GetPayPeriodEndDate())) { // This line used after Date.IsBetween() method is available in List 19-40.
				if (8 < tc.GetHours()) {
					totalPay += itsHourlyRate * 8 + itsHourlyRate * (tc.GetHours() - 8) * 1.5;
				} else {
					totalPay += itsHourlyRate * tc.GetHours();
				}
			}
		}
		return totalPay;
	}
}
