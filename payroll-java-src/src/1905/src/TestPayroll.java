import java.util.Calendar;
import java.util.GregorianCalendar;

import junit.framework.TestCase;

public class TestPayroll extends TestCase {
	// List 19-2 [testAddSalariedEmployee]
	public void testAddSalariedEmployee() {
		System.err.println("TestAddSalariedEmployee");
		int empId = 1;
		AddSalariedEmployee t = new AddSalariedEmployee(empId, "Bob", "Home", 1000.00);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Bob", e.GetName());
		PaymentClassification pc = e.GetClassification();
		SalariedClassification sc = (SalariedClassification) pc;
		assertNotNull(sc);
		assertEquals(1000.00, sc.GetSalary());
		PaymentSchedule ps = e.GetSchedule();
		MonthlySchedule ms = (MonthlySchedule) ps;
		assertNotNull(ms);
		PaymentMethod pm = e.GetMethod();
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// 19.1 Reader Exercise [testAddHourlyEmployee]
	public void testAddHourlyEmployee() {
		System.err.println("TestAddHourlyEmployee");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Bill", e.GetName());
		PaymentClassification pc = e.GetClassification();
		HourlyClassification hc = (HourlyClassification) pc;
		assertNotNull(hc);
		assertEquals(15.25, hc.GetRate());
		PaymentSchedule ps = e.GetSchedule();
		WeeklySchedule ws = (WeeklySchedule) ps;
		assertNotNull(ws);
		PaymentMethod pm = e.GetMethod();
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// 19.1 Reader Exercise [testAddCommissionedEmployee]
	public void testAddCommissionedEmployee() {
		System.err.println("TestAddCommissionedEmployee");
		int empId = 1;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500.0, 3.2);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Lance", e.GetName());
		PaymentClassification pc = e.GetClassification();
		CommissionedClassification cc = (CommissionedClassification) pc;
		assertNotNull(cc);
		assertEquals(2500.0, cc.GetSalary());
		PaymentSchedule ps = e.GetSchedule();
		BiweeklySchedule bs = (BiweeklySchedule) ps;
		assertNotNull(bs);
		PaymentMethod pm = e.GetMethod();
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// List 19-9 [testDeleteEmployee]
	public void testDeleteEmployee() {
		System.err.println("TestDeleteEmployee");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		DeleteEmployeeTransaction dt = new DeleteEmployeeTransaction(empId);
		dt.Execute();
		e = PayrollDatabase.GetEmployee(empId);
		assertNull(e);
	}

	// List 19-12 [testTimeCardTransaction]
	public void testTimeCardTransaction() {
		System.err.println("TestTimeCardTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar date = new GregorianCalendar(2001, Calendar.OCTOBER, 31);
		TimeCardTransaction tct = new TimeCardTransaction(date, 8.0, empId);
		tct.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		HourlyClassification hc = (HourlyClassification) pc;
		assertNotNull(hc);
		TimeCard tc = hc.GetTimeCard(date);
		assertNotNull(tc);
		assertEquals(8.0, tc.GetHours());
	}

	// 19.3 Reader Exercise [testSalesReceiptTransaction]
	public void testSalesReceiptTransaction() {
		System.err.println("TestSalesReceiptTransaction");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		Calendar date = new GregorianCalendar(2001, Calendar.NOVEMBER, 12);
		SalesReceiptTransaction srt = new SalesReceiptTransaction(date, 25000, empId);
		srt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		CommissionedClassification cc = (CommissionedClassification) pc;
		assertNotNull(cc);
		SalesReceipt receipt = cc.GetReceipt(date);
		assertNotNull(receipt);
		assertEquals(25000.0, receipt.GetAmount());
	}

	// List 19-16 [testAddServiceCharge]
	public void testAddServiceCharge() {
		System.err.println("TestAddServiceCharge");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar date = new GregorianCalendar(2001, Calendar.OCTOBER, 31);
		TimeCardTransaction tct = new TimeCardTransaction(date, 8.0, empId);
		tct.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		Affiliation af = new UnionAffiliation(12.5);
		e.SetAffiliation(af);
		int memberId = 86;
		PayrollDatabase.AddUnionMember(memberId, e);
		ServiceChargeTransaction sct = new ServiceChargeTransaction(memberId, date, 12.95);
		sct.Execute();
		double sc = af.GetServiceCharge(date);
		assertEquals(12.95, sc, .001);
	}

	// List 19-19 [testChangeNameTransaction]
	public void testChangeNameTransaction() {
		System.err.println("TestChangeNameTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeNameTransaction cnt = new ChangeNameTransaction(empId, "Bob");
		cnt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Bob", e.GetName());
	}

	// 19.4 Reader Exercise [testChangeAddressTransaction]
	public void testChangeAddressTransaction() {
		System.err.println("TestChangeAddressTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeAddressTransaction cat = new ChangeAddressTransaction(empId, "Second Home");
		cat.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Second Home", e.GetAddress());
	}

	// List 19-24 [testChangeHourlyTransaction]
	public void testChangeHourlyTransaction() {
		System.err.println("TestChangeHourlyTransaction");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		ChangeHourlyTransaction cht = new ChangeHourlyTransaction(empId, 27.52);
		cht.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		assertNotNull(pc);
		HourlyClassification hc = (HourlyClassification) pc;
		assertNotNull(hc);
		assertEquals(27.52, hc.GetRate());
		PaymentSchedule ps = e.GetSchedule();
		WeeklySchedule ws = (WeeklySchedule) ps;
		assertNotNull(ws);
	}

	// 19.4 Reader Exercise [testChangeSalariedTransaction]
	public void testChangeSalariedTransaction() {
		System.err.println("TestChangeSalariedTransaction");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		ChangeSalariedTransaction cst = new ChangeSalariedTransaction(empId, 25000);
		cst.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		assertNotNull(pc);
		SalariedClassification sc = (SalariedClassification) pc;
		assertNotNull(sc);
		assertEquals(25000.0, sc.GetSalary());
		PaymentSchedule ps = e.GetSchedule();
		MonthlySchedule ms = (MonthlySchedule) ps;
		assertNotNull(ms);
	}

	// 19.4 Reader Exercise [testChangeCommissionedTransaction]
	public void testChangeCommissionedTransaction() {
		System.err.println("TestChangeCommissionedTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeCommissionedTransaction cct = new ChangeCommissionedTransaction(empId, 25000, 4.5);
		cct.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		assertNotNull(pc);
		CommissionedClassification cc = (CommissionedClassification) pc;
		assertNotNull(cc);
		assertEquals(25000.0, cc.GetSalary());
		assertEquals(4.5, cc.GetRate());
		PaymentSchedule ps = e.GetSchedule();
		BiweeklySchedule bs = (BiweeklySchedule) ps;
		assertNotNull(bs);
	}

	// 19.4 Reader Exercise [testChangeMailTransaction]
	public void testChangeMailTransaction() {
		System.err.println("TestChangeMailTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeMailTransaction cmt = new ChangeMailTransaction(empId, "4080 El Cerrito Road");
		cmt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentMethod pm = e.GetMethod();
		assertNotNull(pm);
		MailMethod mm = (MailMethod) pm;
		assertNotNull(mm);
		assertEquals("4080 El Cerrito Road", mm.GetAddress());
	}

	// 19.4 Reader Exercise [testChangeDirectTransaction]
	public void testChangeDirectTransaction() {
		System.err.println("TestChangeDirectTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeDirectTransaction cdt = new ChangeDirectTransaction(empId, "FirstNational", "1058209");
		cdt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentMethod pm = e.GetMethod();
		assertNotNull(pm);
		DirectMethod dm = (DirectMethod) pm;
		assertNotNull(dm);
		assertEquals("FirstNational", dm.GetBank());
		assertEquals("1058209", dm.GetAccount());
	}

	// 19.4 Reader Exercise [testChangeHoldTransaction]
	public void testChangeHoldTransaction() {
		System.err.println("TestChangeHoldTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeHoldTransaction cht = new ChangeHoldTransaction(empId);
		cht.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentMethod pm = e.GetMethod();
		assertNotNull(pm);
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// List 19-29 [testChangeMemberTransaction]
	public void testChangeMemberTransaction() {
		System.err.println("TestChangeMemberTransaction");
		int empId = 2;
		int memberId = 7734;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeMemberTransaction cmt = new ChangeMemberTransaction(empId, memberId, 99.42);
		cmt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		Affiliation af = e.GetAffiliation();
		assertNotNull(af);
		UnionAffiliation uf = (UnionAffiliation) af;
		assertNotNull(uf);
		assertEquals(99.42, uf.GetDues());
		Employee member = PayrollDatabase.GetUnionMember(memberId);
		assertNotNull(member);
		assertEquals(e, member);
	}

	// List 19-36 [testPaySingleSalariedEmployee]
	public void testPaySingleSalariedEmployee() {
		System.err.println("TestPaySingleSalariedEmployee");
		int empId = 1;
		AddSalariedEmployee t = new AddSalariedEmployee(empId, "Bob", "Home", 1000.0);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 30);
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 1000.0);
	}

	// List 19-36 [testPaySingleSalariedEmployeeOnWrongDate]
	public void testPaySingleSalariedEmployeeOnWrongDate() {
		System.err.println("TestPaySingleSalariedEmployeeOnWrongDate");
		int empId = 1;
		AddSalariedEmployee t = new AddSalariedEmployee(empId, "Bob", "Home", 1000.00);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 29);
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNull(pc);
	}

	// List 19-40 [testPaySingleHourlyEmployeeNoTimeCards]
	public void testPaySingleHourlyEmployeeNoTimeCards() {
		System.err.println("TestPaySingleHourlyEmployeeNoTimeCards");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 0.0);
	}

	// List 19-40 [ValidateHourlyPaycheck]
	/**
	 * 自給以外の従業員に対しても使用可能なので、 ValidatePaycheckとしてリファクタリング private void
	 * ValidateHourlyPaycheck(PaydayTransaction pt, int empId, Calendar payDate,
	 * double pay) { Paycheck pc = pt.GetPaycheck(empId); assertNotNull(pc);
	 * assertEquals(pc.GetPayPeriodEndDate(), payDate); assertEquals(pay,
	 * pc.GetGrossPay()); assertEquals("Hold", pc.GetField("Disposition"));
	 * assertEquals(0.0, pc.GetDeductions()); assertEquals(pay, pc.GetNetPay()); }
	 */
	// [ValidatePaycheck]
	private void ValidatePaycheck(PaydayTransaction pt, int empId, Calendar payDate, double pay) {
		Paycheck pc = pt.GetPaycheck(empId);
		assertNotNull(pc);
		assertEquals(pc.GetPayPeriodEndDate(), payDate);
		assertEquals(pay, pc.GetGrossPay());
		assertEquals("Hold", pc.GetField("Disposition"));
		assertEquals(0.0, pc.GetDeductions());
		assertEquals(pay, pc.GetNetPay());
	}

	// List 19-41 [testPaySingleHourlyEmployeeOneTimeCard]
	public void testPaySingleHourlyEmployeeOneTimeCard() {
		System.err.println("TestPaySingleHourlyEmployeeOneTimeCard");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		TimeCardTransaction tc = new TimeCardTransaction(payDate, 2.0, empId);
		tc.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 30.5);
	}

	// List 19-41 [testPaySingleHourlyEmployeeOvertimeOneTimeCard]
	public void testPaySingleHourlyEmployeeOvertimeOneTimeCard() {
		System.err.println("TestPaySingleHourlyEmployeeOvertimeOneTimeCard");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		TimeCardTransaction tc = new TimeCardTransaction(payDate, 9.0, empId);
		tc.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, (8 + 1.5) * 15.25);
	}

	// List 19-42 [testPaySingleHourlyEmployeeOnWrongDate]
	public void testPaySingleHourlyEmployeeOnWrongDate() {
		System.err.println("TestPaySingleHourlyEmployeeOnWrongDate");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 8);
		TimeCardTransaction tc = new TimeCardTransaction(payDate, 9.0, empId);
		tc.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNull(pc);
	}

	// List 19-43 [testPaySingleHourlyEmployeeTwoTimeCards]
	public void testPaySingleHourlyEmployeeTwoTimeCards() {
		System.err.println("TestPaySingleHourlyEmployeeTwoTimeCards");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		TimeCardTransaction tc = new TimeCardTransaction(payDate, 2.0, empId);
		tc.Execute();
		TimeCardTransaction tc2 = new TimeCardTransaction(new GregorianCalendar(2001,
				Calendar.NOVEMBER, 8), 5.0, empId);
		tc2.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 7 * 15.25);
	}

	// List 19-44
	// [testPaySingleHourlyEmployeeWithTimeCardsSpanningTwoPayPeriods]
	public void testPaySingleHourlyEmployeeWithTimeCardsSpanningTwoPayPeriods() {
		System.err.println("TestPaySingleHourlyEmployeeWithTimeCardsSpanningTwoPayPeriods");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		Calendar dateInPreviousPayPeriod = new GregorianCalendar(2001, Calendar.NOVEMBER, 2);
		TimeCardTransaction tc = new TimeCardTransaction(payDate, 2.0, empId);
		tc.Execute();
		TimeCardTransaction tc2 = new TimeCardTransaction(dateInPreviousPayPeriod, 5.0, empId);
		tc2.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 2 * 15.25);
	}

	// 19.5 Reader Exercise [testPaySingleCommissionedEmployeeNoSalesReceipts]
	public void testPaySingleCommissionedEmployeeNoSalesReceipts() {
		System.err.println("TestPaySingleCommissionedEmployeeNoSalesReceipts");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 2500.00);
	}

	// 19.5 Reader Exercise [testPaySingleCommissionedEmployeeOneSalesReceipt]
	public void testPaySingleCommissionedEmployeeOneSalesReceipt() {
		System.err.println("TestPaySingleCOmmissionedEmployeeOneSalesReciept");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, .032);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		SalesReceiptTransaction srt = new SalesReceiptTransaction(payDate, 13000.0, empId);
		srt.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 2500.0 + .032 * 13000);
	}

	// 19.5 Reader Exercise [testPaySingleCommissionedEmployeeTwoSalesReceipts]
	public void testPaySingleCommissionedEmployeeTwoSalesReceipts() {
		System.err.println("TestPaySingleCommissionedEmployeeTwoSalesReceipts");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, .032);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		SalesReceiptTransaction srt = new SalesReceiptTransaction(payDate, 13000.0, empId);
		srt.Execute();
		SalesReceiptTransaction srt2 = new SalesReceiptTransaction(new GregorianCalendar(2001,
				Calendar.NOVEMBER, 8), 24000, empId);
		srt2.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 2500.0 + .032 * 13000 + .032 * 24000);
	}

	// 19.5 Reader Exercise [testPaySingleCommissionedEmployeeWrongDate]
	public void testPaySingleCommissionedEmployeeWrongDate() {
		System.err.println("TestPaySingleCommissionedEmployeeWrongDate");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, .032);
		t.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 16);
		SalesReceiptTransaction srt = new SalesReceiptTransaction(payDate, 13000.0, empId);
		srt.Execute();
		SalesReceiptTransaction srt2 = new SalesReceiptTransaction(new GregorianCalendar(2001,
				Calendar.NOVEMBER, 15), 24000, empId);
		srt2.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNull(pc);
	}

	// 19.5 Reader Exercise
	// [testPaySingleCommissionedEmployeeSpanMultiplePayPeriods]
	public void testPaySingleCommissionedEmployeeSpanMultiplePayPeriods() {
		System.err.println("TestPaySingleCommissionedEmployeeSpanMultiplePayPeriods");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, .032);
		t.Execute();
		Calendar earlyDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9); // Previous
		// pay
		// period
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 23); // Biweekly
		// Friday
		Calendar lateDate = new GregorianCalendar(2001, Calendar.DECEMBER, 7); // Next
		// pay
		// period.
		SalesReceiptTransaction srt = new SalesReceiptTransaction(payDate, 13000, empId);
		srt.Execute();
		SalesReceiptTransaction srt2 = new SalesReceiptTransaction(earlyDate, 24000, empId);
		srt2.Execute();
		SalesReceiptTransaction srt3 = new SalesReceiptTransaction(lateDate, 15000, empId);
		srt3.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		ValidatePaycheck(pt, empId, payDate, 2500.0 + .032 * 13000);
	}

	// List 19-47 [testSalariedUnionMemberDues]
	public void testSalariedUnionMemberDues() {
		System.err.println("TestSalariedUnionMemberDues");
		int empId = 1;
		AddSalariedEmployee t = new AddSalariedEmployee(empId, "Bob", "Home", 1000.0);
		t.Execute();
		int memberId = 7734;
		ChangeMemberTransaction cmt = new ChangeMemberTransaction(empId, memberId, 9.42);
		cmt.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 30);
		int fridays = 5; // Fridays in Nov, 2001.
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNotNull(pc);
		assertEquals(pc.GetPayPeriodEndDate(), payDate);
		assertEquals(1000.0, pc.GetGrossPay());
		assertEquals("Hold", pc.GetField("Disposition"));
		assertEquals(fridays * 9.42, pc.GetDeductions());
		assertEquals(1000.0 - fridays * 9.42, pc.GetNetPay());
	}

	// 19.5 Reader Exercise [testHourlyUnionMemberDues]
	public void testHourlyUnionMemberDues() {
		System.err.println("TestHourlyUnionMemberDues");
		int empId = 1;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.24);
		t.Execute();
		int memberId = 7734;
		ChangeMemberTransaction cmt = new ChangeMemberTransaction(empId, memberId, 9.42);
		cmt.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		TimeCardTransaction tct = new TimeCardTransaction(payDate, 8.0, empId);
		tct.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNotNull(pc);
		assertEquals(pc.GetPayPeriodEndDate(), payDate);
		assertEquals(8 * 15.24, pc.GetGrossPay());
		assertEquals("Hold", pc.GetField("Disposition"));
		assertEquals(9.42, pc.GetDeductions());
		assertEquals(8 * 15.24 - 9.42, pc.GetNetPay());
	}

	// 19.5 Reader Exercise [testCommissionedUnionMemberDues]
	public void testCommissionedUnionMemberDues() {
		System.err.println("TestCommissionedUnionMemberDues");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, .032);
		t.Execute();
		int memberId = 7734;
		ChangeMemberTransaction cmt = new ChangeMemberTransaction(empId, memberId, 9.42);
		cmt.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNotNull(pc);
		assertEquals(pc.GetPayPeriodEndDate(), payDate);
		assertEquals(2500.0, pc.GetGrossPay());
		assertEquals("Hold", pc.GetField("Disposition"));
		assertEquals(2 * 9.42, pc.GetDeductions());
		assertEquals(2500.0 - 2 * 9.42, pc.GetNetPay());
	}

	// List 19-51 [testHourlyUnionMemberServiceCharge]
	public void testHourlyUnionMemberServiceCharge() {
		System.err.println("TestHourlyUnionMemberServiceCharge");
		int empId = 1;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.24);
		t.Execute();
		int memberId = 7734;
		ChangeMemberTransaction cmt = new ChangeMemberTransaction(empId, memberId, 9.42);
		cmt.Execute();
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		ServiceChargeTransaction sct = new ServiceChargeTransaction(memberId, payDate, 19.42);
		sct.Execute();
		TimeCardTransaction tct = new TimeCardTransaction(payDate, 8.0, empId);
		tct.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNotNull(pc);
		assertEquals(pc.GetPayPeriodEndDate(), payDate);
		assertEquals(8 * 15.24, pc.GetGrossPay());
		assertEquals("Hold", pc.GetField("Disposition"));
		assertEquals(9.42 + 19.42, pc.GetDeductions());
		assertEquals(8 * 15.24 - (9.42 + 19.42), pc.GetNetPay());
	}

	// List 19-52 [testServiceChargesSpanningMultiplePayPeriods]
	public void testServiceChargesSpanningMultiplePayPeriods() {
		System.err.println("TestServiceChargesSpanningMultiplePayPeriods");
		int empId = 1;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.24);
		t.Execute();
		int memberId = 7734;
		ChangeMemberTransaction cmt = new ChangeMemberTransaction(empId, memberId, 9.42);
		cmt.Execute();
		Calendar earlyDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 2); // Previous
		// Friday
		Calendar payDate = new GregorianCalendar(2001, Calendar.NOVEMBER, 9);
		Calendar lateDate = new GregorianCalendar(2001, Calendar.DECEMBER, 16); // Next
		// Friday
		ServiceChargeTransaction sct = new ServiceChargeTransaction(memberId, payDate, 19.42);
		sct.Execute();
		ServiceChargeTransaction sctEarly = new ServiceChargeTransaction(memberId, earlyDate,
				100.00);
		sctEarly.Execute();
		ServiceChargeTransaction sctLate = new ServiceChargeTransaction(memberId, lateDate, 200.00);
		sctLate.Execute();
		TimeCardTransaction tct = new TimeCardTransaction(payDate, 8.0, empId);
		tct.Execute();
		PaydayTransaction pt = new PaydayTransaction(payDate);
		pt.Execute();
		Paycheck pc = pt.GetPaycheck(empId);
		assertNotNull(pc);
		assertEquals(pc.GetPayPeriodEndDate(), payDate);
		assertEquals(8 * 15.24, pc.GetGrossPay());
		assertEquals("Hold", pc.GetField("Disposition"));
		assertEquals(9.42 + 19.42, pc.GetDeductions());
		assertEquals(8 * 15.24 - (9.42 + 19.42), pc.GetNetPay());
	}
}