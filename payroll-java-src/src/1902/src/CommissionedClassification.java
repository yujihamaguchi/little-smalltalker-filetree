public class CommissionedClassification implements PaymentClassification {
	private double itsSalary;
	private double itsCommissionRate;

	public CommissionedClassification(double salary, double commissionRate) {
		itsSalary = salary;
		itsCommissionRate = commissionRate;
	}

	public double GetSalary() {
		return itsSalary;
	}

	public double GetRate() {
		return itsCommissionRate;
	}
}
