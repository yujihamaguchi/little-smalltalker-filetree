public class HourlyClassification implements PaymentClassification {
	private double itsHourlyRate;

	public HourlyClassification(double hourlyRate) {
		itsHourlyRate = hourlyRate;
	}

	public double GetRate() {
		return itsHourlyRate;
	}
}
