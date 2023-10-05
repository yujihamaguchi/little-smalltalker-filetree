import java.util.HashMap;
import java.util.Map;

public class HourlyClassification implements PaymentClassification {
	private Map<Long, TimeCard> itsTimeCards;
	private double itsHourlyRate;

	public HourlyClassification(double hourlyRate) {
		itsTimeCards = new HashMap<Long, TimeCard>();
		itsHourlyRate = hourlyRate;
	}

	public double GetRate() {
		return itsHourlyRate;
	}

	public TimeCard GetTimeCard(long date) {
		return itsTimeCards.get(date);
	}

	public void AddTimeCard(TimeCard tc) {
		itsTimeCards.put(tc.GetDate(), tc);
	}
}
