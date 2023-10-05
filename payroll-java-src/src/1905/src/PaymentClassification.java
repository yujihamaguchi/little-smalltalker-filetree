//import java.util.Calendar; // This line is used with List 19-36.

public interface PaymentClassification {
	abstract double CalculatePay(Paycheck pc);
	/*
	// The following method is used with List 19-36.
	// You don't use this method after Date.IsBetween() method is available in List 19-40.

	public default boolean IsInPayPeriod(Calendar theDate, Paycheck pc) {
		Calendar payPeriodStartDate = pc.GetPayPeriodStartDate();
		Calendar payPeriodEndDate = pc.GetPayPeriodEndDate();
		if (0 <= theDate.compareTo(payPeriodStartDate)
				&& theDate.compareTo(payPeriodEndDate) <= 0) {
			return true;
		}
		return false;
	}
	*/
}
