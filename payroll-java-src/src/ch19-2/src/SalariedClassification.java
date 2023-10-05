public class SalariedClassification implements PaymentClassification {
	private double itsSalary;

	public SalariedClassification(double salary) {
		itsSalary = salary;
	}

	public double GetSalary() {
		return itsSalary;
	}
}
