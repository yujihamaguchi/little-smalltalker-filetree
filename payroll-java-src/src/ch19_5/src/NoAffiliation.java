import java.util.Calendar;

public class NoAffiliation implements Affiliation {
	public double GetServiceCharge(Calendar date) {
		return 0;
	}

	public double CalculateDeductions(Paycheck pc) {
		return 0;
	}
}
