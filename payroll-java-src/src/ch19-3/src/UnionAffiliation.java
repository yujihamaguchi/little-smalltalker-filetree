import java.util.HashMap;
import java.util.Map;

public class UnionAffiliation implements Affiliation {
	private Map<Long, ServiceCharge> itsServiceCharges = new HashMap<Long, ServiceCharge>();

	public UnionAffiliation(double d) {
		// TODO Auto-generated constructor stub
	}

	public double GetServiceCharge(long date) {
		if (itsServiceCharges.get(date) == null) {
			return 0;
		}
		return itsServiceCharges.get(date).GetAmount();
	}

	public void AddServiceCahrge(long date, double amount) {
		itsServiceCharges.put(date, new ServiceCharge(date, amount));
	}
}
