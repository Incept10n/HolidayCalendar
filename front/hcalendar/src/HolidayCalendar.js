import React, { useState, useEffect } from 'react';
import Calendar from 'react-calendar';
import 'react-calendar/dist/Calendar.css';

const API_URL = process.env.REACT_APP_API_URL;

const monthNames = [
  'january', 'february', 'march', 'april', 'may', 'june',
  'july', 'august', 'september', 'october', 'november', 'december'
];

const HolidayCalendar = () => {
  const [date, setDate] = useState(new Date());
  const [holidays, setHolidays] = useState([]);

  useEffect(() => {
    const fetchHolidays = async () => {
      const day = date.getDate();
      const month = monthNames[date.getMonth()];
      try {
        const response = await fetch(`${API_URL}?day=${day}&month=${month}`);
        const data = await response.json();
        setHolidays(Array.isArray(data.holidays) ? data.holidays : []);
      } catch (error) {
        console.error('Error fetching holidays:', error);
        setHolidays([]);
      }
    };
    fetchHolidays();
  }, [date]);

  const handleDateChange = (selectedDate) => {
    setDate(selectedDate);
  };

  return (
    <div className="max-w-xl mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4 text-center">Holiday Calendar</h1>
      
      <Calendar 
        onChange={handleDateChange} 
        value={date} 
      />

      <div className="mt-4">
        <h2 className="text-xl font-semibold mb-2">
          Holidays on {date.toDateString()}:
        </h2>
        {holidays.length > 0 ? (
                  <div>
                      {holidays.map((holiday, idx) => (
                          <div key={idx} className="mb-1"><strong>{holiday}</strong></div>
                      ))}
                  </div>
        ) : (
          <p>No holidays on this day.</p>
        )}
      </div>
    </div>
  );
};

export default HolidayCalendar;
