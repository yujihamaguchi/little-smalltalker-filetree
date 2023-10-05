import java.util.HashMap;
import java.util.Map;

public class CommissionedClassification implements PaymentClassification {
	private double itsSalary;
	private double itsCommissionRate;
	private Map<Long, SalesReceipt> itsReceipts;

	public CommissionedClassification(double salary, double commissionRate) {
		itsSalary = salary;
		itsCommissionRate = commissionRate;
		itsReceipts = new HashMap<Long, SalesReceipt>();
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

	public SalesReceipt GetReceipt(long date) {
		return itsReceipts.get(date);
	}
}
