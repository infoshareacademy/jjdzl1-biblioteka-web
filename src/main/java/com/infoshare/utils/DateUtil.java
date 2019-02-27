package com.infoshare.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    public static String currentFormatedDate() {

        Calendar now = Calendar.getInstance();
        Date currentDate = now.getTime();
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        String formatedCurrentDate = format.format(currentDate);
        return formatedCurrentDate;
    }

    public static String currentPlusThreeDaysFormatedDate() {
        Calendar now = Calendar.getInstance();
        now.add(Calendar.DAY_OF_MONTH, 3);
        Date currentDatePlusThreeDays = now.getTime();
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        String date = format.format(currentDatePlusThreeDays);
        return date;
    }

}
