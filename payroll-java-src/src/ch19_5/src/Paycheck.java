import java.util.Calendar;

public class Paycheck {
	private Calendar itsPayPeriodStartDate;
	private Calendar itsPayPeriodEndDate;
	private double itsGrossPay;
	private double itsDeductions;
	private double itsNetPay;

	public Paycheck(Calendar payPeriodStartDate, Calendar payPeriodEndDate) {
		itsPayPeriodStartDate = payPeriodStartDate;
		itsPayPeriodEndDate = payPeriodEndDate;
	}

	public Calendar GetPayPeriodStartDate() {
		return itsPayPeriodStartDate;
	}

	public Calendar GetPayPeriodEndDate() {
		return itsPayPeriodEndDate;
	}

	public double GetGrossPay() {
		return itsGrossPay;
	}

	public void SetGrossPay(double grossPay) {
		itsGrossPay = grossPay;
	}

	public String GetField(String string) {
		if (string.equals("Disposition")) {
			return "Hold";
		}
		return null;
	}

	public double GetDeductions() {
		return itsDeductions;
	}

	public void SetDeductions(double deductions) {
		itsDeductions = deductions;
	}

	public double GetNetPay() {
		return itsNetPay;
	}

	public void SetNetPay(double netPay) {
		itsNetPay = netPay;
	}

	/*
	// The following medhod is used with List 19-32 & List 19-36.
	public Calendar GetPayDate() {
		return itsPayPeriodEndDate;
	}
	*/
}
