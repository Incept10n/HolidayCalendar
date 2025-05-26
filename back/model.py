from sqlalchemy import Integer, String, Column
from dbConnection import Base

class dates(Base):
    __tablename__ = "dates"

    id = Column(Integer, primary_key=True)
    day = Column(Integer)
    month = Column(String(250))
    holiday = Column(String(250))

