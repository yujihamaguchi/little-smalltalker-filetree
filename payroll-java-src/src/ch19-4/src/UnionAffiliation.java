import java.util.HashMap;
import java.util.Map;

public class UnionAffiliation implements Affiliation {
	private Map<Long, ServiceCharge> itsServiceCharges = new HashMap<Long, ServiceCharge>();
	private int itsMemberId;
	private double itsDues;

	public UnionAffiliation(double dues) {
		itsDues = dues;
	}

	public UnionAffiliation(int memberId, double dues) {
		itsMemberId = memberId;
		itsDues = dues;
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

	public int GetMemberId() {
		return itsMemberId;
	}

	public double GetDues() {
		return itsDues;
	}
}
