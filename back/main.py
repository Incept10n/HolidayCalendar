from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import select
from dbConnection import get_db
from model import dates
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api")
def getHoliday(day: int, month: str, db: Session = Depends(get_db)):
    stmt = select(dates).where(dates.day == day, dates.month == month)
    result = db.execute(stmt).scalars().all()

    if not result:
        raise HTTPException(status_code=404, detail="Holiday not found")

    return {"holidays": [row.holiday for row in result]}
