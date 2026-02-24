# Digital Marketing Campaign Analytics System

## Project Overview
[cite_start]This project presents the design and implementation of a robust **Digital Marketing Campaign Analytics System** developed using **MySQL**[cite: 13, 14]. [cite_start]The system addresses real-world marketing challenges by centralizing data from 6 major platforms—Google Ads, Facebook, Instagram, YouTube, Twitter, and Email—to enable data-driven decision-making[cite: 16, 23, 24].

[cite_start]The project encompasses the complete database lifecycle: problem identification, ER diagram design, schema creation, data population (200+ records), and advanced SQL analysis[cite: 15, 30, 31, 32].

## Database Architecture
[cite_start]The database follows a normalized relational structure (3NF) consisting of 8 interrelated tables[cite: 26, 30]:

* [cite_start]**MARKETING_MANAGER**: Stores details of team members managing the campaigns[cite: 117].
* [cite_start]**PLATFORM**: Contains the digital advertising channels used[cite: 125].
* [cite_start]**CAMPAIGN**: The central entity storing budgets, timelines, and target audiences[cite: 135].
* [cite_start]**CUSTOMER**: Detailed profiles including demographics and segmentation (e.g., Student, Manager)[cite: 157, 425].
* [cite_start]**AD**: Individual ad creatives and performance metrics like Impressions and Clicks[cite: 174].
* [cite_start]**INTERACTION**: Tracks every customer action (Click, View, Share, Like, Comment) and the device used[cite: 190, 196, 198].
* [cite_start]**CONVERSION**: Records successful business outcomes (Purchase, Signup, Download, Subscription) and their values[cite: 205, 211].
* [cite_start]**FEEDBACK**: Qualitative customer ratings (1-5 stars) and comments[cite: 215, 220].

## Key Analytics & SQL Queries
[cite_start]The system utilizes 15 complex SQL queries to extract critical marketing KPIs[cite: 339, 565]:
1.  [cite_start]**ROI Analysis**: Compares total revenue against budget for each campaign[cite: 362].
2.  [cite_start]**CTR (Click-Through Rate)**: Evaluates ad effectiveness by dividing clicks by impressions[cite: 379].
3.  [cite_start]**Conversion Rate**: Measures the percentage of interactions that result in a conversion[cite: 482].
4.  [cite_start]**Cost Per Conversion (CPC)**: Identifies the financial efficiency of each campaign[cite: 538].
5.  [cite_start]**Segment & Demographic Analysis**: Breaks down revenue by professional segment and gender[cite: 424, 497].
6.  [cite_start]**Trend Analysis**: Identifies monthly revenue trends and peak marketing periods[cite: 446].

## Business Insights & Findings
* [cite_start]**Top Platform**: **Google Ads** generated the highest revenue due to high-intent search traffic[cite: 557].
* [cite_start]**Mobile Dominance**: **55%** of all interactions occur on Mobile devices, highlighting the need for mobile-first design[cite: 444, 557].
* [cite_start]**High-Value Segment**: **Young Professionals** showed the highest conversion rates and average order values[cite: 435, 557].
* [cite_start]**Peak Season**: **November-December** (Festive/Holiday season) showed the highest monthly revenue spikes[cite: 455, 557].
* [cite_start]**Efficiency**: The **Black Friday Mega Sale** was the most successful campaign in terms of conversion volume[cite: 557].

## Recommendations
* [cite_start]**Budget Allocation**: Increase spend on Google Ads and YouTube based on superior ROI[cite: 559].
* [cite_start]**Targeting**: Focus efforts on the **Young Professional** segment for higher ROI[cite: 559].
* [cite_start]**Ad Formats**: Invest more in **Search and Video Ads**, which consistently show higher CTR[cite: 560].
* [cite_start]**Customer Retention**: Utilize personalized email campaigns to re-engage inactive customers[cite: 560].

## Technical Skills Demonstrated
* [cite_start]**Relational Database Design**: 3NF Normalization and ER Modeling[cite: 30, 568].
* [cite_start]**Advanced SQL**: Complex JOINS, Aggregate Functions, GROUP BY, HAVING, and Subqueries[cite: 568].
* [cite_start]**Data Analysis**: Transforming raw records into actionable Business Intelligence (BI)[cite: 566].

---
[cite_start]**Project by:** PARV & AWANTIKA KHOLIA [cite: 6, 7]  
[cite_start]**Course:** Big Data Management & Analytics [cite: 4]  
[cite_start]**Institution:** FORE School of Management, New Delhi [cite: 2]
