package PayrollImplementation;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import PayrollDomain.PaymentClassification;
import PayrollUtiil.Date;
import PayrollDomain.Paycheck;

public class HourlyClassification implements PaymentClassification {
	private Map<Calendar, TimeCard> itsTimeCards;
	private double itsHourlyRate;

	public HourlyClassification(double hourlyRate) {
		itsTimeCards = new HashMap<Calendar, TimeCard>();
		itsHourlyRate = hourlyRate;
	}

	public double GetRate() {
		return itsHourlyRate;
	}

	public TimeCard GetTimeCard(Calendar date) {
		return itsTimeCards.get(date);
	}

	public void AddTimeCard(Calendar date, double hours) {
		itsTimeCards.put(date, new TimeCard(date, hours));
	}

	public double CalculatePay(Paycheck pc) {
		double totalPay = 0;
		for (TimeCard tc : itsTimeCards.values()) {
			if (Date.IsBetween(tc.GetDate(), pc.GetPayPeriodStartDate(), pc.GetPayPeriodEndDate())) {
				if (8 < tc.GetHours()) {
					totalPay += itsHourlyRate * 8 + itsHourlyRate * (tc.GetHours() - 8) * 1.5;
				} else {
					totalPay += itsHourlyRate * tc.GetHours();
				}
			}
		}
		return totalPay;
	}
}
