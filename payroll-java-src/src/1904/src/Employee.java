class Employee {
	private int itsEmpId;
	private String itsName;
	private String itsAddress;
	private PaymentClassification itsClassification;
	private PaymentSchedule itsSchedule;
	private PaymentMethod itsPaymentMethod;
	private Affiliation itsAffiliation;

	public Employee(int empId, String name, String address) {
		itsEmpId = empId;
		itsName = name;
		itsAddress = address;
	}

	public int GetEmpId() {
		return itsEmpId;
	}

	public String GetName() {
		return itsName;
	}

	public void SetName(String name) {
		itsName = name;
	}

	public String GetAddress() {
		return itsAddress;
	}

	public void SetAddress(String address) {
		itsAddress = address;
	}

	public PaymentClassification GetClassification() {
		return itsClassification;
	}

	public void SetClassification(PaymentClassification pc) {
		itsClassification = pc;
	}

	public PaymentSchedule GetSchedule() {
		return itsSchedule;
	}

	public void SetSchedule(PaymentSchedule ps) {
		itsSchedule = ps;
	}

	public PaymentMethod GetMethod() {
		return itsPaymentMethod;
	}

	public void SetMethod(PaymentMethod pm) {
		itsPaymentMethod = pm;
	}

	public Affiliation GetAffiliation() {
		return itsAffiliation;
	}

	public void SetAffiliation(Affiliation af) {
		itsAffiliation = af;
	}
}
