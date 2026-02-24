-- ============================================================
--   DIGITAL MARKETING CAMPAIGN ANALYTICS SYSTEM
--   Course: Big Data Management & Analytics
--   Database: MySQL
-- ============================================================

DROP DATABASE IF EXISTS digital_marketing_db;
CREATE DATABASE digital_marketing_db;
USE digital_marketing_db;

-- ============================================================
-- TABLE 1: MARKETING_MANAGER
-- ============================================================
CREATE TABLE MARKETING_MANAGER (
    ManagerID       INT PRIMARY KEY AUTO_INCREMENT,
    FirstName       VARCHAR(50) NOT NULL,
    LastName        VARCHAR(50) NOT NULL,
    Email           VARCHAR(100) UNIQUE NOT NULL,
    Department      VARCHAR(50) NOT NULL
);

-- ============================================================
-- TABLE 2: PLATFORM
-- ============================================================
CREATE TABLE PLATFORM (
    PlatformID          INT PRIMARY KEY AUTO_INCREMENT,
    PlatformName        VARCHAR(50) NOT NULL,
    PlatformType        VARCHAR(50) NOT NULL,
    MonthlyActiveUsers  BIGINT NOT NULL
);

-- ============================================================
-- TABLE 3: CAMPAIGN
-- ============================================================
CREATE TABLE CAMPAIGN (
    CampaignID      INT PRIMARY KEY AUTO_INCREMENT,
    CampaignName    VARCHAR(100) NOT NULL,
    StartDate       DATE NOT NULL,
    EndDate         DATE NOT NULL,
    Budget          DECIMAL(12,2) NOT NULL,
    TargetAudience  VARCHAR(100),
    PlatformID      INT NOT NULL,
    ManagerID       INT NOT NULL,
    FOREIGN KEY (PlatformID) REFERENCES PLATFORM(PlatformID),
    FOREIGN KEY (ManagerID)  REFERENCES MARKETING_MANAGER(ManagerID)
);

-- ============================================================
-- TABLE 4: CUSTOMER
-- ============================================================
CREATE TABLE CUSTOMER (
    CustomerID  INT PRIMARY KEY AUTO_INCREMENT,
    FirstName   VARCHAR(50) NOT NULL,
    LastName    VARCHAR(50) NOT NULL,
    Email       VARCHAR(100) UNIQUE NOT NULL,
    Phone       VARCHAR(20),
    City        VARCHAR(50),
    Age         INT CHECK (Age BETWEEN 18 AND 90),
    Gender      ENUM('Male','Female','Other') NOT NULL,
    Segment     VARCHAR(50)
);

-- ============================================================
-- TABLE 5: AD
-- ============================================================
CREATE TABLE AD (
    AdID        INT PRIMARY KEY AUTO_INCREMENT,
    AdTitle     VARCHAR(100) NOT NULL,
    AdType      VARCHAR(50) NOT NULL,
    AdCost      DECIMAL(10,2) NOT NULL,
    Impressions INT DEFAULT 0,
    Clicks      INT DEFAULT 0,
    CampaignID  INT NOT NULL,
    FOREIGN KEY (CampaignID) REFERENCES CAMPAIGN(CampaignID)
);

-- ============================================================
-- TABLE 6: INTERACTION
-- ============================================================
CREATE TABLE INTERACTION (
    InteractionID   INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID      INT NOT NULL,
    AdID            INT NOT NULL,
    InteractionType ENUM('Click','View','Share','Like','Comment') NOT NULL,
    InteractionDate DATE NOT NULL,
    DeviceUsed      ENUM('Mobile','Desktop','Tablet') NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (AdID)       REFERENCES AD(AdID)
);

-- ============================================================
-- TABLE 7: CONVERSION
-- ============================================================
CREATE TABLE CONVERSION (
    ConversionID    INT PRIMARY KEY AUTO_INCREMENT,
    InteractionID   INT NOT NULL UNIQUE,
    ConversionType  ENUM('Purchase','Signup','Download','Subscription') NOT NULL,
    ConversionValue DECIMAL(10,2) NOT NULL,
    ConversionDate  DATE NOT NULL,
    FOREIGN KEY (InteractionID) REFERENCES INTERACTION(InteractionID)
);

-- ============================================================
-- TABLE 8: FEEDBACK
-- ============================================================
CREATE TABLE FEEDBACK (
    FeedbackID      INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID      INT NOT NULL,
    CampaignID      INT NOT NULL,
    Rating          INT CHECK (Rating BETWEEN 1 AND 5),
    Comments        TEXT,
    FeedbackDate    DATE NOT NULL,
    FOREIGN KEY (CustomerID)  REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (CampaignID)  REFERENCES CAMPAIGN(CampaignID)
);


-- ============================================================
-- DATA ENTRY: MARKETING_MANAGER (10 records)
-- ============================================================
INSERT INTO MARKETING_MANAGER (FirstName, LastName, Email, Department) VALUES
('Alice',   'Johnson',  'alice.johnson@markpro.com',   'Digital Marketing'),
('Bob',     'Smith',    'bob.smith@markpro.com',       'Performance Marketing'),
('Carol',   'Davis',    'carol.davis@markpro.com',     'Brand Marketing'),
('David',   'Wilson',   'david.wilson@markpro.com',    'Social Media'),
('Eva',     'Martinez', 'eva.martinez@markpro.com',    'Content Marketing'),
('Frank',   'Lee',      'frank.lee@markpro.com',       'Email Marketing'),
('Grace',   'Taylor',   'grace.taylor@markpro.com',    'SEO & SEM'),
('Henry',   'Anderson', 'henry.anderson@markpro.com',  'Influencer Marketing'),
('Isla',    'Thomas',   'isla.thomas@markpro.com',     'Analytics'),
('James',   'Jackson',  'james.jackson@markpro.com',   'Growth Marketing');


-- ============================================================
-- DATA ENTRY: PLATFORM (6 records)
-- ============================================================
INSERT INTO PLATFORM (PlatformName, PlatformType, MonthlyActiveUsers) VALUES
('Google Ads',  'Search Advertising',   4000000000),
('Facebook',    'Social Media',         2900000000),
('Instagram',   'Social Media',         2000000000),
('YouTube',     'Video Advertising',    2700000000),
('Twitter/X',   'Social Media',          550000000),
('Email',       'Direct Marketing',      400000000);


-- ============================================================
-- DATA ENTRY: CAMPAIGN (20 records)
-- ============================================================
INSERT INTO CAMPAIGN (CampaignName, StartDate, EndDate, Budget, TargetAudience, PlatformID, ManagerID) VALUES
('Summer Sale Blast',           '2024-06-01', '2024-06-30', 50000.00,  'Age 18-35, Shoppers',          1, 1),
('Brand Awareness Q3',          '2024-07-01', '2024-09-30', 80000.00,  'All Demographics',             2, 2),
('Product Launch – ProMax',     '2024-08-01', '2024-08-31', 60000.00,  'Tech Enthusiasts',             3, 3),
('Holiday Season Push',         '2024-12-01', '2024-12-31', 120000.00, 'Families, Gift Buyers',        1, 4),
('New Year Email Drive',        '2025-01-01', '2025-01-15', 15000.00,  'Existing Customers',           6, 5),
('Valentine Special',           '2025-02-01', '2025-02-14', 25000.00,  'Couples, Age 22-40',           2, 6),
('Back to School',              '2024-08-15', '2024-09-10', 40000.00,  'Students, Parents',            3, 7),
('Spring Collection',           '2025-03-01', '2025-03-31', 35000.00,  'Fashion Enthusiasts',          4, 8),
('YouTube Video Campaign',      '2024-09-01', '2024-09-30', 70000.00,  'Age 18-45',                   4, 9),
('Twitter Engagement Drive',    '2024-10-01', '2024-10-31', 20000.00,  'Tech Savvy Users',             5, 10),
('Flash Sale October',          '2024-10-15', '2024-10-20', 10000.00,  'Deal Seekers',                 1, 1),
('Festive Season FB',           '2024-11-01', '2024-11-30', 55000.00,  'All Demographics',             2, 2),
('Black Friday Deals',          '2024-11-25', '2024-11-30', 90000.00,  'Bargain Hunters',              1, 3),
('Cyber Monday Push',           '2024-12-02', '2024-12-03', 45000.00,  'Online Shoppers',              1, 4),
('Instagram Reels Drive',       '2025-01-16', '2025-02-15', 30000.00,  'Gen Z, Millennials',           3, 5),
('Email Re-engagement',         '2025-02-16', '2025-03-15', 12000.00,  'Inactive Customers',           6, 6),
('Google Search Boost',         '2025-03-16', '2025-04-15', 65000.00,  'High Intent Buyers',           1, 7),
('YouTube Shorts Promo',        '2025-04-01', '2025-04-30', 28000.00,  'Mobile Users',                 4, 8),
('Summer Preview 2025',         '2025-05-01', '2025-05-31', 42000.00,  'Age 18-30',                   2, 9),
('Loyalty Rewards Email',       '2025-05-15', '2025-06-15', 18000.00,  'Loyal Customers',              6, 10);


-- ============================================================
-- DATA ENTRY: CUSTOMER (50 records)
-- ============================================================
INSERT INTO CUSTOMER (FirstName, LastName, Email, Phone, City, Age, Gender, Segment) VALUES
('Aarav',    'Sharma',    'aarav.sharma@gmail.com',     '9810001001', 'Delhi',     25, 'Male',   'Young Professional'),
('Priya',    'Verma',     'priya.verma@gmail.com',      '9820001002', 'Mumbai',    30, 'Female', 'Homemaker'),
('Rohit',    'Singh',     'rohit.singh@gmail.com',      '9830001003', 'Bangalore', 22, 'Male',   'Student'),
('Sneha',    'Patel',     'sneha.patel@gmail.com',      '9840001004', 'Ahmedabad', 28, 'Female', 'Young Professional'),
('Vikram',   'Kumar',     'vikram.kumar@gmail.com',     '9850001005', 'Chennai',   35, 'Male',   'Manager'),
('Anjali',   'Mehta',     'anjali.mehta@gmail.com',     '9860001006', 'Hyderabad', 26, 'Female', 'Young Professional'),
('Karan',    'Joshi',     'karan.joshi@gmail.com',      '9870001007', 'Pune',      32, 'Male',   'Entrepreneur'),
('Pooja',    'Gupta',     'pooja.gupta@gmail.com',      '9880001008', 'Kolkata',   27, 'Female', 'Student'),
('Arjun',    'Nair',      'arjun.nair@gmail.com',       '9890001009', 'Kochi',     40, 'Male',   'Senior Professional'),
('Divya',    'Rao',       'divya.rao@gmail.com',        '9800001010', 'Bangalore', 23, 'Female', 'Student'),
('Rahul',    'Chopra',    'rahul.chopra@gmail.com',     '9811001011', 'Delhi',     29, 'Male',   'Young Professional'),
('Meera',    'Shah',      'meera.shah@gmail.com',       '9821001012', 'Surat',     31, 'Female', 'Homemaker'),
('Suresh',   'Reddy',     'suresh.reddy@gmail.com',     '9831001013', 'Hyderabad', 45, 'Male',   'Senior Professional'),
('Kavya',    'Iyer',      'kavya.iyer@gmail.com',       '9841001014', 'Chennai',   24, 'Female', 'Student'),
('Nikhil',   'Malhotra',  'nikhil.malhotra@gmail.com',  '9851001015', 'Chandigarh',33, 'Male',  'Manager'),
('Shruti',   'Pandey',    'shruti.pandey@gmail.com',    '9861001016', 'Lucknow',   27, 'Female', 'Young Professional'),
('Amit',     'Tiwari',    'amit.tiwari@gmail.com',      '9871001017', 'Jaipur',    38, 'Male',   'Entrepreneur'),
('Neha',     'Bose',      'neha.bose@gmail.com',        '9881001018', 'Kolkata',   22, 'Female', 'Student'),
('Siddharth','Kapoor',    'siddharth.kapoor@gmail.com', '9891001019', 'Mumbai',    34, 'Male',   'Manager'),
('Ananya',   'Desai',     'ananya.desai@gmail.com',     '9801001020', 'Vadodara',  26, 'Female', 'Young Professional'),
('Vishal',   'Mishra',    'vishal.mishra@gmail.com',    '9812001021', 'Bhopal',    31, 'Male',   'Manager'),
('Riya',     'Saxena',    'riya.saxena@gmail.com',      '9822001022', 'Agra',      25, 'Female', 'Student'),
('Manish',   'Dubey',     'manish.dubey@gmail.com',     '9832001023', 'Varanasi',  42, 'Male',   'Senior Professional'),
('Tanvi',    'Ghosh',     'tanvi.ghosh@gmail.com',      '9842001024', 'Kolkata',   28, 'Female', 'Young Professional'),
('Rajesh',   'Pillai',    'rajesh.pillai@gmail.com',    '9852001025', 'Trivandrum',36, 'Male',  'Manager'),
('Ishaan',   'Banerjee',  'ishaan.banerjee@gmail.com',  '9862001026', 'Kolkata',   21, 'Male',   'Student'),
('Simran',   'Kaur',      'simran.kaur@gmail.com',      '9872001027', 'Amritsar',  29, 'Female', 'Young Professional'),
('Deepak',   'Sinha',     'deepak.sinha@gmail.com',     '9882001028', 'Patna',     44, 'Male',   'Senior Professional'),
('Nandini',  'Agarwal',   'nandini.agarwal@gmail.com',  '9892001029', 'Jaipur',    23, 'Female', 'Student'),
('Tarun',    'Bajaj',     'tarun.bajaj@gmail.com',      '9802001030', 'Ludhiana',  37, 'Male',   'Entrepreneur'),
('Bhavna',   'Chaudhary', 'bhavna.chaudhary@gmail.com', '9813001031', 'Jodhpur',   32, 'Female', 'Homemaker'),
('Gaurav',   'Mathur',    'gaurav.mathur@gmail.com',    '9823001032', 'Meerut',    26, 'Male',   'Young Professional'),
('Swati',    'Kulkarni',  'swati.kulkarni@gmail.com',   '9833001033', 'Pune',      30, 'Female', 'Manager'),
('Aditya',   'Menon',     'aditya.menon@gmail.com',     '9843001034', 'Kochi',     27, 'Male',   'Young Professional'),
('Kritika',  'Jain',      'kritika.jain@gmail.com',     '9853001035', 'Indore',    24, 'Female', 'Student'),
('Harish',   'Srivastava','harish.srivastava@gmail.com','9863001036', 'Allahabad', 48, 'Male',   'Senior Professional'),
('Pallavi',  'Nambiar',   'pallavi.nambiar@gmail.com',  '9873001037', 'Kozhikode', 31, 'Female', 'Homemaker'),
('Sanket',   'Wagh',      'sanket.wagh@gmail.com',      '9883001038', 'Nashik',    22, 'Male',   'Student'),
('Lakshmi',  'Subramaniam','lakshmi.sub@gmail.com',     '9893001039', 'Coimbatore',35, 'Female','Manager'),
('Pranav',   'Hegde',     'pranav.hegde@gmail.com',     '9803001040', 'Mangalore', 29, 'Male',   'Young Professional'),
('Charu',    'Rastogi',   'charu.rastogi@gmail.com',    '9814001041', 'Dehradun',  26, 'Female', 'Young Professional'),
('Varun',    'Oberoi',    'varun.oberoi@gmail.com',     '9824001042', 'Delhi',     33, 'Male',   'Manager'),
('Ritu',     'Bhatt',     'ritu.bhatt@gmail.com',       '9834001043', 'Haridwar',  28, 'Female', 'Homemaker'),
('Saurabh',  'Tripathi',  'saurabh.tripathi@gmail.com', '9844001044', 'Gorakhpur', 41, 'Male',   'Senior Professional'),
('Yukta',    'Dixit',     'yukta.dixit@gmail.com',      '9854001045', 'Gwalior',   23, 'Female', 'Student'),
('Mohit',    'Arora',     'mohit.arora@gmail.com',      '9864001046', 'Faridabad', 30, 'Male',   'Young Professional'),
('Sonali',   'Pawar',     'sonali.pawar@gmail.com',     '9874001047', 'Kolhapur',  27, 'Female', 'Young Professional'),
('Kunal',    'Sethi',     'kunal.sethi@gmail.com',      '9884001048', 'Ludhiana',  36, 'Male',   'Entrepreneur'),
('Preeti',   'Lamba',     'preeti.lamba@gmail.com',     '9894001049', 'Rohtak',    25, 'Female', 'Student'),
('Ashish',   'Dutta',     'ashish.dutta@gmail.com',     '9804001050', 'Guwahati',  39, 'Male',   'Manager');


-- ============================================================
-- DATA ENTRY: AD (30 records)
-- ============================================================
INSERT INTO AD (AdTitle, AdType, AdCost, Impressions, Clicks, CampaignID) VALUES
('Summer Deals – Shop Now',         'Banner',       5000.00,  150000, 4500,  1),
('Beat the Heat – 50% OFF',         'Search Ad',    4500.00,  120000, 3800,  1),
('Know Our Brand Video',            'Video Ad',     8000.00,  200000, 6000,  2),
('Brand Story Carousel',            'Carousel',     4000.00,  180000, 5200,  2),
('ProMax – Power Unleashed',        'Video Ad',     7500.00,  250000, 9000,  3),
('ProMax Features Reel',            'Reel Ad',      6000.00,  220000, 8200,  3),
('Holiday Gifting Guide',           'Banner',       9000.00,  300000, 11000, 4),
('Christmas Sale – Last Day',       'Search Ad',    8500.00,  280000, 10500, 4),
('New Year New You',                'Email Banner', 2000.00,   80000, 3200,  5),
('Valentine Gifts for Her',         'Carousel',     3500.00,  130000, 5100,  6),
('Love Is in the Air',              'Video Ad',     4000.00,  140000, 5600,  6),
('Back to School Essentials',       'Banner',       4200.00,  160000, 5800,  7),
('Top 10 School Supplies',          'Search Ad',    3800.00,  140000, 4900,  7),
('Spring Collection – New Arrivals','Video Ad',     5500.00,  190000, 7000,  8),
('Fresh Spring Styles',             'Carousel',     4800.00,  170000, 6200,  8),
('YouTube Pre-roll Ad',             'Video Ad',    10000.00,  350000,12000,  9),
('YouTube Mid-roll Ad',             'Video Ad',     9000.00,  320000,11000,  9),
('Twitter Poll – Tech Opinions',    'Promoted Post',2500.00,   90000, 3000, 10),
('Flash Sale – 24 Hours Only',      'Search Ad',    2000.00,   70000, 4200, 11),
('Festive Season Best Deals',       'Banner',       6000.00,  210000, 7800, 12),
('Diwali Sale Carousel',            'Carousel',     5500.00,  200000, 7200, 12),
('Black Friday Mega Sale',          'Search Ad',   11000.00,  400000,16000, 13),
('Black Friday Banner',             'Banner',       9500.00,  380000,14000, 13),
('Cyber Monday Deals',              'Search Ad',    8000.00,  290000,12500, 14),
('Instagram Reels – Trending',      'Reel Ad',      4500.00,  175000, 8000, 15),
('Re-engage – We Miss You',         'Email Banner', 1500.00,   60000, 2500, 16),
('Google Shopping Boost',           'Shopping Ad',  9000.00,  310000,13000, 17),
('YouTube Shorts – Quick Deals',    'Video Ad',     5000.00,  230000, 9500, 18),
('Summer Preview Lookbook',         'Carousel',     6000.00,  200000, 7500, 19),
('Loyalty Rewards – Claim Now',     'Email Banner', 2500.00,   75000, 3800, 20);


-- ============================================================
-- DATA ENTRY: INTERACTION (60 records)
-- ============================================================
INSERT INTO INTERACTION (CustomerID, AdID, InteractionType, InteractionDate, DeviceUsed) VALUES
(1,  1,  'Click',   '2024-06-02', 'Mobile'),
(2,  2,  'View',    '2024-06-03', 'Desktop'),
(3,  3,  'Like',    '2024-07-05', 'Mobile'),
(4,  4,  'Share',   '2024-07-10', 'Tablet'),
(5,  5,  'Click',   '2024-08-02', 'Desktop'),
(6,  6,  'Click',   '2024-08-05', 'Mobile'),
(7,  7,  'Click',   '2024-12-02', 'Mobile'),
(8,  8,  'Click',   '2024-12-10', 'Desktop'),
(9,  9,  'Click',   '2025-01-03', 'Mobile'),
(10, 10, 'Click',   '2025-02-02', 'Mobile'),
(11, 11, 'View',    '2025-02-05', 'Desktop'),
(12, 12, 'Click',   '2024-08-16', 'Mobile'),
(13, 13, 'Click',   '2024-08-20', 'Desktop'),
(14, 14, 'Like',    '2025-03-02', 'Mobile'),
(15, 15, 'Click',   '2025-03-10', 'Tablet'),
(16, 16, 'Click',   '2024-09-02', 'Mobile'),
(17, 17, 'View',    '2024-09-05', 'Desktop'),
(18, 18, 'Comment', '2024-10-05', 'Mobile'),
(19, 19, 'Click',   '2024-10-15', 'Desktop'),
(20, 20, 'Click',   '2024-11-03', 'Mobile'),
(21, 21, 'Click',   '2024-11-10', 'Tablet'),
(22, 22, 'Click',   '2024-11-25', 'Mobile'),
(23, 23, 'Click',   '2024-11-26', 'Desktop'),
(24, 24, 'Click',   '2024-12-02', 'Mobile'),
(25, 25, 'Click',   '2025-01-20', 'Mobile'),
(26, 26, 'Click',   '2025-02-20', 'Desktop'),
(27, 27, 'Click',   '2025-03-18', 'Mobile'),
(28, 28, 'Click',   '2025-04-05', 'Tablet'),
(29, 29, 'Click',   '2025-05-03', 'Mobile'),
(30, 30, 'Click',   '2025-05-16', 'Desktop'),
(1,  5,  'Click',   '2024-08-10', 'Mobile'),
(2,  7,  'Click',   '2024-12-05', 'Desktop'),
(3,  22, 'Click',   '2024-11-25', 'Mobile'),
(4,  16, 'View',    '2024-09-03', 'Tablet'),
(5,  27, 'Click',   '2025-03-20', 'Desktop'),
(6,  19, 'Click',   '2024-10-16', 'Mobile'),
(7,  24, 'Click',   '2024-12-03', 'Mobile'),
(8,  10, 'Click',   '2025-02-03', 'Desktop'),
(9,  14, 'Like',    '2025-03-03', 'Mobile'),
(10, 28, 'Click',   '2025-04-06', 'Mobile'),
(11, 22, 'Click',   '2024-11-26', 'Tablet'),
(12, 7,  'Click',   '2024-12-03', 'Desktop'),
(13, 1,  'Click',   '2024-06-05', 'Mobile'),
(14, 20, 'Click',   '2024-11-04', 'Mobile'),
(15, 29, 'Click',   '2025-05-05', 'Desktop'),
(16, 22, 'Click',   '2024-11-27', 'Mobile'),
(17, 8,  'Click',   '2024-12-12', 'Desktop'),
(18, 5,  'Click',   '2024-08-12', 'Mobile'),
(19, 16, 'Click',   '2024-09-04', 'Tablet'),
(20, 30, 'Click',   '2025-05-18', 'Mobile'),
(21, 27, 'Click',   '2025-03-22', 'Mobile'),
(22, 19, 'Click',   '2024-10-18', 'Desktop'),
(23, 7,  'Click',   '2024-12-08', 'Mobile'),
(24, 1,  'Click',   '2024-06-10', 'Mobile'),
(25, 22, 'Click',   '2024-11-28', 'Desktop'),
(26, 8,  'Click',   '2024-12-15', 'Mobile'),
(27, 5,  'Click',   '2024-08-15', 'Tablet'),
(28, 16, 'Click',   '2024-09-06', 'Mobile'),
(29, 22, 'Click',   '2024-11-29', 'Desktop'),
(30, 7,  'Click',   '2024-12-12', 'Mobile');


-- ============================================================
-- DATA ENTRY: CONVERSION (30 records)
-- ============================================================
INSERT INTO CONVERSION (InteractionID, ConversionType, ConversionValue, ConversionDate) VALUES
(1,  'Purchase',     1500.00, '2024-06-02'),
(5,  'Purchase',     4999.00, '2024-08-02'),
(6,  'Purchase',     4599.00, '2024-08-05'),
(7,  'Purchase',     2500.00, '2024-12-02'),
(8,  'Purchase',     3200.00, '2024-12-10'),
(9,  'Signup',        500.00, '2025-01-03'),
(10, 'Purchase',     1800.00, '2025-02-02'),
(12, 'Purchase',      899.00, '2024-08-16'),
(13, 'Purchase',     1200.00, '2024-08-20'),
(15, 'Purchase',     2200.00, '2025-03-10'),
(16, 'Purchase',     5500.00, '2024-09-02'),
(19, 'Purchase',      799.00, '2024-10-15'),
(20, 'Purchase',     1500.00, '2024-11-03'),
(22, 'Purchase',     3500.00, '2024-11-25'),
(23, 'Purchase',     4000.00, '2024-11-26'),
(24, 'Purchase',     2800.00, '2024-12-02'),
(25, 'Signup',        300.00, '2025-01-20'),
(27, 'Purchase',     1200.00, '2025-03-18'),
(28, 'Download',      199.00, '2025-04-05'),
(29, 'Subscription', 999.00,  '2025-05-03'),
(31, 'Purchase',     4800.00, '2024-08-10'),
(32, 'Purchase',     2600.00, '2024-12-05'),
(33, 'Purchase',     3900.00, '2024-11-25'),
(35, 'Purchase',     1100.00, '2025-03-20'),
(36, 'Purchase',      799.00, '2024-10-16'),
(37, 'Purchase',     2900.00, '2024-12-03'),
(40, 'Download',      149.00, '2025-04-06'),
(44, 'Purchase',     1600.00, '2024-11-04'),
(47, 'Purchase',     3100.00, '2024-12-12'),
(50, 'Subscription', 499.00,  '2025-05-18');


-- ============================================================
-- DATA ENTRY: FEEDBACK (30 records)
-- ============================================================
INSERT INTO FEEDBACK (CustomerID, CampaignID, Rating, Comments, FeedbackDate) VALUES
(1,  1,  5, 'Great deals! Loved the summer sale.',           '2024-06-30'),
(2,  2,  4, 'Good brand content, very relatable.',           '2024-09-30'),
(3,  3,  5, 'ProMax campaign was awesome and creative.',     '2024-08-31'),
(4,  4,  4, 'Holiday ads were festive and engaging.',        '2024-12-31'),
(5,  5,  3, 'Decent email but could be more personalized.',  '2025-01-15'),
(6,  6,  5, 'Valentine campaign was beautiful!',             '2025-02-14'),
(7,  7,  4, 'Back to school ads were very helpful.',         '2024-09-10'),
(8,  8,  4, 'Spring collection looks amazing.',              '2025-03-31'),
(9,  9,  5, 'YouTube campaign was very engaging.',           '2024-09-30'),
(10, 10, 3, 'Twitter campaign was OK.',                      '2024-10-31'),
(11, 11, 4, 'Flash sale was exciting but very short.',       '2024-10-20'),
(12, 12, 5, 'Festive season deals were fantastic!',          '2024-11-30'),
(13, 13, 5, 'Black Friday campaign was the best!',           '2024-11-30'),
(14, 14, 4, 'Cyber Monday had great deals.',                 '2024-12-03'),
(15, 15, 4, 'Instagram reels were trendy and fun.',          '2025-02-15'),
(16, 16, 2, 'Re-engagement email felt a bit generic.',       '2025-03-15'),
(17, 17, 5, 'Google search ads were very targeted.',         '2025-04-15'),
(18, 18, 4, 'YouTube Shorts were quick and effective.',      '2025-04-30'),
(19, 19, 5, 'Summer preview campaign is very exciting!',     '2025-05-31'),
(20, 20, 4, 'Loyalty rewards email was a nice gesture.',     '2025-06-15'),
(21, 1,  4, 'Good sale but wished for more discounts.',      '2024-06-30'),
(22, 3,  5, 'ProMax launch campaign was innovative.',        '2024-08-31'),
(23, 13, 5, 'Amazing Black Friday offers!',                  '2024-11-30'),
(24, 4,  5, 'Best holiday campaign I have seen.',            '2024-12-31'),
(25, 2,  3, 'Brand campaign was okay, not very memorable.', '2024-09-30'),
(26, 6,  4, 'Valentine ads were sweet and romantic.',        '2025-02-14'),
(27, 17, 5, 'Very relevant search ads, converted quickly!',  '2025-04-15'),
(28, 9,  4, 'YouTube ads had great production quality.',     '2024-09-30'),
(29, 19, 4, 'Looking forward to the summer collection.',     '2025-05-31'),
(30, 20, 5, 'Love the loyalty program! Great initiative.',   '2025-06-15');


-- ============================================================
-- ANALYTICAL SQL QUERIES
-- ============================================================

-- QUERY 1: Total Budget Spent per Campaign with Platform Name
SELECT 
    C.CampaignID,
    C.CampaignName,
    P.PlatformName,
    C.Budget,
    C.StartDate,
    C.EndDate
FROM CAMPAIGN C
JOIN PLATFORM P ON C.PlatformID = P.PlatformID
ORDER BY C.Budget DESC;

-- QUERY 2: Campaign ROI – Revenue vs Budget
SELECT 
    C.CampaignName,
    C.Budget,
    COALESCE(SUM(CV.ConversionValue), 0) AS TotalRevenue,
    ROUND((COALESCE(SUM(CV.ConversionValue), 0) - C.Budget) / C.Budget * 100, 2) AS ROI_Percentage
FROM CAMPAIGN C
LEFT JOIN AD A ON C.CampaignID = A.CampaignID
LEFT JOIN INTERACTION I ON A.AdID = I.AdID
LEFT JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY C.CampaignID, C.CampaignName, C.Budget
ORDER BY ROI_Percentage DESC;

-- QUERY 3: Click-Through Rate (CTR) per Ad
SELECT 
    AdID,
    AdTitle,
    AdType,
    Impressions,
    Clicks,
    ROUND((Clicks / Impressions) * 100, 2) AS CTR_Percentage
FROM AD
ORDER BY CTR_Percentage DESC;

-- QUERY 4: Total Conversions and Revenue per Platform
SELECT 
    P.PlatformName,
    COUNT(CV.ConversionID) AS TotalConversions,
    ROUND(SUM(CV.ConversionValue), 2) AS TotalRevenue
FROM PLATFORM P
JOIN CAMPAIGN C  ON P.PlatformID = C.PlatformID
JOIN AD A        ON C.CampaignID = A.CampaignID
JOIN INTERACTION I ON A.AdID = I.AdID
JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY P.PlatformName
ORDER BY TotalRevenue DESC;

-- QUERY 5: Top 5 Best Performing Ads by Conversions
SELECT 
    A.AdID,
    A.AdTitle,
    A.AdType,
    COUNT(CV.ConversionID) AS TotalConversions,
    SUM(CV.ConversionValue) AS TotalRevenue
FROM AD A
JOIN INTERACTION I ON A.AdID = I.AdID
JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY A.AdID, A.AdTitle, A.AdType
ORDER BY TotalConversions DESC
LIMIT 5;

-- QUERY 6: Customer Segment Analysis – Which Segment Converts Most
SELECT 
    CU.Segment,
    COUNT(CV.ConversionID) AS TotalConversions,
    ROUND(SUM(CV.ConversionValue), 2) AS TotalRevenue,
    ROUND(AVG(CV.ConversionValue), 2) AS AvgOrderValue
FROM CUSTOMER CU
JOIN INTERACTION I ON CU.CustomerID = I.CustomerID
JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY CU.Segment
ORDER BY TotalRevenue DESC;

-- QUERY 7: Device Usage in Interactions
SELECT 
    DeviceUsed,
    COUNT(*) AS TotalInteractions,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM INTERACTION), 2) AS Percentage
FROM INTERACTION
GROUP BY DeviceUsed
ORDER BY TotalInteractions DESC;

-- QUERY 8: Monthly Campaign Performance (Revenue by Month)
SELECT 
    DATE_FORMAT(CV.ConversionDate, '%Y-%m') AS Month,
    COUNT(CV.ConversionID) AS TotalConversions,
    ROUND(SUM(CV.ConversionValue), 2) AS TotalRevenue
FROM CONVERSION CV
GROUP BY Month
ORDER BY Month;

-- QUERY 9: Average Campaign Rating per Platform
SELECT 
    P.PlatformName,
    ROUND(AVG(F.Rating), 2) AS AvgRating,
    COUNT(F.FeedbackID) AS TotalReviews
FROM PLATFORM P
JOIN CAMPAIGN C  ON P.PlatformID = C.PlatformID
JOIN FEEDBACK F  ON C.CampaignID = F.CampaignID
GROUP BY P.PlatformName
ORDER BY AvgRating DESC;

-- QUERY 10: Manager Performance – Revenue Generated per Manager
SELECT 
    CONCAT(MM.FirstName, ' ', MM.LastName) AS ManagerName,
    MM.Department,
    COUNT(DISTINCT C.CampaignID) AS CampaignsManaged,
    ROUND(SUM(CV.ConversionValue), 2) AS TotalRevenueGenerated
FROM MARKETING_MANAGER MM
JOIN CAMPAIGN C   ON MM.ManagerID = C.ManagerID
JOIN AD A         ON C.CampaignID = A.CampaignID
JOIN INTERACTION I ON A.AdID = I.AdID
JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY MM.ManagerID, ManagerName, MM.Department
ORDER BY TotalRevenueGenerated DESC;

-- QUERY 11: Conversion Rate per Campaign
SELECT 
    C.CampaignName,
    COUNT(DISTINCT I.InteractionID) AS TotalInteractions,
    COUNT(DISTINCT CV.ConversionID) AS TotalConversions,
    ROUND(COUNT(DISTINCT CV.ConversionID) * 100.0 / COUNT(DISTINCT I.InteractionID), 2) AS ConversionRate_Pct
FROM CAMPAIGN C
JOIN AD A ON C.CampaignID = A.CampaignID
JOIN INTERACTION I ON A.AdID = I.AdID
LEFT JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY C.CampaignID, C.CampaignName
ORDER BY ConversionRate_Pct DESC;

-- QUERY 12: Gender-wise Revenue Analysis
SELECT 
    CU.Gender,
    COUNT(CV.ConversionID) AS TotalConversions,
    ROUND(SUM(CV.ConversionValue), 2) AS TotalRevenue
FROM CUSTOMER CU
JOIN INTERACTION I ON CU.CustomerID = I.CustomerID
JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY CU.Gender
ORDER BY TotalRevenue DESC;

-- QUERY 13: Top 10 Customers by Total Purchase Value
SELECT 
    CU.CustomerID,
    CONCAT(CU.FirstName, ' ', CU.LastName) AS CustomerName,
    CU.City,
    CU.Segment,
    COUNT(CV.ConversionID) AS TotalPurchases,
    ROUND(SUM(CV.ConversionValue), 2) AS TotalSpent
FROM CUSTOMER CU
JOIN INTERACTION I ON CU.CustomerID = I.CustomerID
JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY CU.CustomerID, CustomerName, CU.City, CU.Segment
ORDER BY TotalSpent DESC
LIMIT 10;

-- QUERY 14: Campaigns with Highest Customer Satisfaction (Avg Rating > 4)
SELECT 
    C.CampaignName,
    P.PlatformName,
    ROUND(AVG(F.Rating), 2) AS AvgRating,
    COUNT(F.FeedbackID) AS NumberOfReviews
FROM CAMPAIGN C
JOIN PLATFORM P ON C.PlatformID = P.PlatformID
JOIN FEEDBACK F ON C.CampaignID = F.CampaignID
GROUP BY C.CampaignID, C.CampaignName, P.PlatformName
HAVING AvgRating > 4
ORDER BY AvgRating DESC;

-- QUERY 15: Cost Per Conversion (CPC) per Campaign
SELECT 
    C.CampaignName,
    C.Budget,
    COUNT(CV.ConversionID) AS TotalConversions,
    ROUND(C.Budget / NULLIF(COUNT(CV.ConversionID), 0), 2) AS CostPerConversion
FROM CAMPAIGN C
JOIN AD A ON C.CampaignID = A.CampaignID
JOIN INTERACTION I ON A.AdID = I.AdID
LEFT JOIN CONVERSION CV ON I.InteractionID = CV.InteractionID
GROUP BY C.CampaignID, C.CampaignName, C.Budget
ORDER BY CostPerConversion ASC;