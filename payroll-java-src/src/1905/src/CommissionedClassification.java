import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class CommissionedClassification implements PaymentClassification {
	private double itsSalary;
	private double itsCommissionRate;
	private Map<Calendar, SalesReceipt> itsReceipts;

	public CommissionedClassification(double salary, double commissionRate) {
		itsSalary = salary;
		itsCommissionRate = commissionRate;
		itsReceipts = new HashMap<Calendar, SalesReceipt>();
	}

	public double GetSalary() {
		return itsSalary;
	}

	public double GetRate() {
		return itsCommissionRate;
	}

	public void AddReceipt(SalesReceipt sr) {
		itsReceipts.put(sr.GetSaleDate(), sr);
	}

	public SalesReceipt GetReceipt(Calendar date) {
		return itsReceipts.get(date);
	}

	public double CalculatePay(Paycheck pc) {
		double commission = 0.0;
		for (SalesReceipt receipt : itsReceipts.values()) {
			if (Date.IsBetween(receipt.GetSaleDate(), pc.GetPayPeriodStartDate(), pc
					.GetPayPeriodEndDate())) {
				commission += receipt.GetAmount() * itsCommissionRate;
			}
		}
		return itsSalary + commission;
	}
}
