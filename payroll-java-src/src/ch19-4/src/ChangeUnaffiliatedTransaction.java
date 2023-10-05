public class ChangeUnaffiliatedTransaction extends ChangeAffiliationTransaction {
	public ChangeUnaffiliatedTransaction(int empId) {
		super(empId);
	}

	public Affiliation GetAffiliation() {
		return new NoAffiliation();
	}

	public void RecordMembership(Employee e) {
		Affiliation af = e.GetAffiliation();
		if (af instanceof UnionAffiliation) {
			UnionAffiliation uf = (UnionAffiliation) af;
			int memberId = uf.GetMemberId();
			PayrollDatabase.RemoveUnionMember(memberId);
		}
	}
}
