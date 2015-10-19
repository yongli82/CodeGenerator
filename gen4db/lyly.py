# coding: utf-8
from sqlalchemy import Column, Date, DateTime, Float, Index, Integer, String, Table, Text, text
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Address(Base):
    __tablename__ = 'addresses'

    id = Column(Integer, primary_key=True)
    uid = Column(String(256), nullable=False)
    address1 = Column(String(256))
    address2 = Column(String(256))
    address3 = Column(String(256))
    address4 = Column(String(256))
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)
    mobile = Column(String(30))
    name = Column(String(10))


class Applier(Base):
    __tablename__ = 'applier'
    __table_args__ = (
        Index('applier_uid_oid', 'uid', 'oid', unique=True),
    )

    id = Column(Integer, primary_key=True)
    uid = Column(Integer, index=True)
    oid = Column(Integer, index=True)
    comment = Column(Text)
    mark = Column(Integer, server_default=text("'0'"))
    updated_at = Column(DateTime, nullable=False)
    created_at = Column(DateTime, nullable=False)
    status = Column(String(100), nullable=False)
    score = Column(Integer)
    rank = Column(Integer, server_default=text("'0'"))
    employer_mark = Column(Integer)
    employer_comment = Column(Text, nullable=False)


class Certification(Base):
    __tablename__ = 'certification'

    id = Column(Integer, primary_key=True)
    updated_at = Column(DateTime, nullable=False)
    created_at = Column(DateTime, nullable=False)
    idcard = Column(Text)
    license = Column(Text)
    status = Column(Text)
    uid = Column(Integer, unique=True)


class Comment(Base):
    __tablename__ = 'comments'

    id = Column(Integer, primary_key=True)
    oid = Column(Integer, nullable=False)
    pid = Column(Integer, nullable=False)
    desciprtion = Column(String(256), nullable=False)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)


class Group(Base):
    __tablename__ = 'groups'

    id = Column(Integer, primary_key=True)
    name = Column(String(255, u'utf8_unicode_ci'), nullable=False, unique=True)
    permissions = Column(Text(collation=u'utf8_unicode_ci'))
    created_at = Column(DateTime, nullable=False, server_default=text("'0000-00-00 00:00:00'"))
    updated_at = Column(DateTime, nullable=False, server_default=text("'0000-00-00 00:00:00'"))


class Member(Base):
    __tablename__ = 'members'

    id = Column(Integer, primary_key=True)
    member_no = Column(String(256), nullable=False)
    password = Column(String(256))
    role = Column(Integer, server_default=text("'0'"))
    mobile = Column(String(30))
    name = Column(String(10))
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)
    station_id = Column(Integer)


class Message(Base):
    __tablename__ = 'message'

    id = Column(Integer, primary_key=True)
    status = Column(String(20, u'utf8_unicode_ci'))
    content = Column(Text(collation=u'utf8_unicode_ci'))
    fromUser = Column(String(255, u'utf8_unicode_ci'))
    toUser = Column(String(255, u'utf8_unicode_ci'))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)
    title = Column(Text)


t_migrations = Table(
    'migrations', metadata,
    Column('migration', String(255, u'utf8_unicode_ci'), nullable=False),
    Column('batch', Integer, nullable=False)
)


class OfferingPackage(Base):
    __tablename__ = 'offering_package'

    id = Column(Integer, primary_key=True)
    offering_id = Column(Integer, nullable=False)
    package_id = Column(Integer, nullable=False)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)


class Offering(Base):
    __tablename__ = 'offerings'

    id = Column(Integer, primary_key=True)
    name = Column(String(256), nullable=False)
    desciprtion = Column(String(256), nullable=False)
    price = Column(Integer, nullable=False)
    priceunit = Column(String(3), nullable=False, server_default=text("'CNY'"))
    amount = Column(Integer)
    pkgids = Column(String(100))
    begin_sold = Column(DateTime, nullable=False)
    end_sold = Column(DateTime, nullable=False)
    image1 = Column(String(512))
    image2 = Column(String(512))
    image3 = Column(String(512))
    image4 = Column(String(512))
    image5 = Column(String(512))
    image6 = Column(String(512))
    image7 = Column(String(512))
    image8 = Column(String(512))
    image9 = Column(String(512))
    image10 = Column(String(512))
    image11 = Column(String(512))
    image12 = Column(String(512))
    image13 = Column(String(512))
    image14 = Column(String(512))
    image15 = Column(String(512))
    image16 = Column(String(512))
    image17 = Column(String(512))
    image18 = Column(String(512))
    image19 = Column(String(512))
    image20 = Column(String(512))
    banner1 = Column(String(512))
    banner2 = Column(String(512))
    banner3 = Column(String(512))
    banner4 = Column(String(512))
    banner5 = Column(String(512))
    banner6 = Column(String(512))
    banner7 = Column(String(512))
    banner8 = Column(String(512))
    banner9 = Column(String(512))
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)
    cover_image = Column(String(512))


class OperationBanner(Base):
    __tablename__ = 'operation_banner'

    id = Column(Integer, primary_key=True)
    status = Column(String(20))
    link = Column(Text)
    image = Column(Text)
    description = Column(Text)
    created_at = Column(Date, nullable=False)
    updated_at = Column(Date, nullable=False)


class OrderSerial(Base):
    __tablename__ = 'order_serial'

    id = Column(Integer, primary_key=True)
    oid = Column(Integer, nullable=False)
    pid = Column(Integer, nullable=False)
    offer_pkgid = Column(Integer, nullable=False)
    amount = Column(Integer, nullable=False)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)


class Order(Base):
    __tablename__ = 'orders'

    id = Column(Integer, primary_key=True)
    status = Column(Integer, nullable=False, server_default=text("'0'"))
    addressid = Column(Integer, nullable=False)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)
    oper_id = Column(Integer)
    sender_id = Column(Integer)
    station_id = Column(Integer)
    send_time = Column(DateTime)
    receive_time = Column(DateTime)
    actual_receive_time = Column(DateTime)
    customer_id = Column(Integer)


class Package(Base):
    __tablename__ = 'packages'

    id = Column(Integer, primary_key=True)
    offering_name1 = Column(String(256))
    offering_count1 = Column(Integer)
    offering_name2 = Column(String(256))
    offering_count2 = Column(Integer)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)


class Recuit(Base):
    __tablename__ = 'recuit'

    id = Column(Integer, primary_key=True)
    title = Column(Text)
    level = Column(Integer, server_default=text("'0'"))
    number = Column(Integer, server_default=text("'0'"))
    salary = Column(Float, server_default=text("'0'"))
    gender = Column(String(10))
    address = Column(Text)
    description = Column(Text)
    city = Column(String(255))
    district = Column(String(255))
    contact = Column(String(20))
    mobile = Column(String(30))
    uid = Column(Integer)
    status = Column(String(20))
    tend = Column(Text)
    starttime = Column(DateTime)
    endtime = Column(DateTime)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)
    worktime = Column(DateTime)
    settop = Column(Integer, server_default=text("'0'"))
    unit = Column(Text)


class SenderApprove(Base):
    __tablename__ = 'sender_approve'

    id = Column(Integer, primary_key=True)
    uid = Column(Integer, nullable=False)
    status = Column(Integer, server_default=text("'0'"))
    opinion = Column(String(256))
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)


class Station(Base):
    __tablename__ = 'stations'

    id = Column(Integer, primary_key=True)
    name = Column(String(256), nullable=False)
    desciprtion = Column(String(256), nullable=False)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)


class Throttle(Base):
    __tablename__ = 'throttle'

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, index=True)
    ip_address = Column(String(255, u'utf8_unicode_ci'))
    attempts = Column(Integer, nullable=False, server_default=text("'0'"))
    suspended = Column(Integer, nullable=False, server_default=text("'0'"))
    banned = Column(Integer, nullable=False, server_default=text("'0'"))
    last_attempt_at = Column(DateTime)
    suspended_at = Column(DateTime)
    banned_at = Column(DateTime)


class User(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True)
    password = Column(String(255, u'utf8_unicode_ci'), nullable=False)
    permissions = Column(Text(collation=u'utf8_unicode_ci'))
    activated = Column(Integer, nullable=False, server_default=text("'0'"))
    activation_code = Column(String(255, u'utf8_unicode_ci'), index=True)
    activated_at = Column(DateTime)
    last_login = Column(DateTime)
    persist_code = Column(String(255, u'utf8_unicode_ci'))
    reset_password_code = Column(String(255, u'utf8_unicode_ci'), index=True)
    first_name = Column(String(255, u'utf8_unicode_ci'))
    last_name = Column(String(255, u'utf8_unicode_ci'))
    created_at = Column(DateTime, nullable=False, server_default=text("'0000-00-00 00:00:00'"))
    updated_at = Column(DateTime, nullable=False, server_default=text("'0000-00-00 00:00:00'"))
    nick = Column(String(255, u'utf8_unicode_ci'))
    type = Column(String(100, u'utf8_unicode_ci'), nullable=False)
    mobile = Column(String(11, u'utf8_unicode_ci'), nullable=False, unique=True)
    birth = Column(Date)
    gender = Column(String(6, u'utf8_unicode_ci'))
    height = Column(Integer)
    school = Column(Text(collation=u'utf8_unicode_ci'))
    email = Column(Text(collation=u'utf8_unicode_ci'))
    qq = Column(Text(collation=u'utf8_unicode_ci'))
    tend = Column(Text(collation=u'utf8_unicode_ci'))
    intro = Column(Text(collation=u'utf8_unicode_ci'))
    experience = Column(Text(collation=u'utf8_unicode_ci'))
    address = Column(Text(collation=u'utf8_unicode_ci'))
    province = Column(String(50, u'utf8_unicode_ci'))
    city = Column(String(50, u'utf8_unicode_ci'))
    name = Column(Text(collation=u'utf8_unicode_ci'))
    freetime = Column(Text(collation=u'utf8_unicode_ci'))
    rank = Column(Integer, server_default=text("'0'"))
    mark = Column(Integer, server_default=text("'0'"))
    score = Column(Integer, server_default=text("'0'"))
    all_score = Column(Integer, nullable=False, server_default=text("'0'"))
    image = Column(Text(collation=u'utf8_unicode_ci'), nullable=False)
    authentication = Column(String(100, u'utf8_unicode_ci'), server_default=text("'UNAPPROVED'"))
    register_id = Column(String(100, u'utf8_unicode_ci'))
    zero_times = Column(Integer, server_default=text("'0'"))


class UsersGroup(Base):
    __tablename__ = 'users_groups'

    user_id = Column(Integer, primary_key=True, nullable=False)
    group_id = Column(Integer, primary_key=True, nullable=False)


class VerifyCode(Base):
    __tablename__ = 'verify_codes'

    id = Column(Integer, primary_key=True)
    verify_code = Column(String(256))
    verify_type = Column(String(256))
    outer_id = Column(String(256))
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)
