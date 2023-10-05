import java.util.Calendar;

public class ServiceChargeTransaction implements Transaction {
	private int memberId;
	private Calendar date;
	private double amount;

	public ServiceChargeTransaction(int memberId, Calendar date, double amount) {
		this.memberId = memberId;
		this.date = date;
		this.amount = amount;
	}

	public void Execute() {
		Employee e = PayrollDatabase.GetUnionMember(memberId);
		Affiliation af = e.GetAffiliation();
		if (af instanceof UnionAffiliation) {
			UnionAffiliation uaf = (UnionAffiliation) af;
			uaf.AddServiceCahrge(date, amount);
		}
	}
}
