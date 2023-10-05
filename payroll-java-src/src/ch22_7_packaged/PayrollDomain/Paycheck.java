package PayrollDomain;

import java.util.Calendar;

public interface Paycheck {
	public Calendar GetPayPeriodStartDate();

	public Calendar GetPayPeriodEndDate();

	public double GetGrossPay();

	public void SetGrossPay(double grossPay);

	public String GetField(String string);

	public double GetDeductions();

	public void SetDeductions(double deductions);

	public double GetNetPay();

	public void SetNetPay(double netPay);
}
