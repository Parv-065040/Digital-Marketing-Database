# Digital Marketing Campaign Analytics System

## Project Overview
This project presents the design and implementation of a robust **Digital Marketing Campaign Analytics System** developed using **MySQL**. The system addresses real-world marketing challenges by centralizing data from 6 major platforms—Google Ads, Facebook, Instagram, YouTube, Twitter, and Email—to enable data-driven decision-making.

The project encompasses the complete database development lifecycle: problem identification, ER diagram design, schema creation, data population with over 230+ records, and the execution of advanced SQL analytical queries.

## Database Architecture
The database follows a normalized relational structure (3NF) consisting of 8 interrelated tables:

* **MARKETING_MANAGER**: Stores details of team members responsible for running campaigns.
* **PLATFORM**: Contains digital advertising platforms like Google Ads and social media channels.
* **CAMPAIGN**: The central table storing budgets, timelines, and target audience data.
* **CUSTOMER**: Detailed profiles including demographics and segmentation (e.g., Young Professional, Student).
* **AD**: Individual ad creatives and performance metrics like Impressions and Clicks.
* **INTERACTION**: Tracks every customer action (Click, View, Share, Like, Comment) and the device used.
* **CONVERSION**: Records successful business outcomes (Purchase, Signup, Download, Subscription) and their values.
* **FEEDBACK**: Qualitative customer ratings (1-5 stars) and performance comments.

## Key Analytics & SQL Queries
The system utilizes 15 specialized SQL queries to extract critical marketing KPIs:
1.  **ROI Analysis**: Calculates Return on Investment by comparing total revenue against campaign budgets.
2.  **CTR (Click-Through Rate)**: Evaluates ad effectiveness as (Clicks / Impressions) x 100.
3.  **Conversion Rate**: Measures the percentage of interactions that resulted in a successful conversion.
4.  **Cost Per Conversion (CPC)**: Identifies the financial efficiency of each campaign.
5.  **Segment Analysis**: Analyzes which customer segments generate the most revenue and highest average order value.
6.  **Trend Analysis**: Identifies monthly revenue trends to highlight peak marketing periods.

## Business Insights & Findings
* **Top Platform**: **Google Ads** generated the highest revenue due to high-intent search traffic.
* **Mobile Dominance**: **55%** of all interactions occur on Mobile devices, emphasizing the need for mobile-first design.
* **High-Value Segment**: **Young Professionals** showed the highest conversion rates and average order values.
* **Peak Season**: **November-December** (Festive/Holiday season) showed the highest monthly revenue spikes.
* **Customer Satisfaction**: Top-rated campaigns included the Black Friday Mega Sale and Product Launch-ProMax.

## Recommendations
* **Budget Allocation**: Increase spend on Google Ads and YouTube based on their superior ROI.
* **Targeting**: Focus marketing efforts on the **Young Professional** segment for higher order values.
* **Optimization**: Ensure all ad creatives are optimized for **Mobile** devices as they drive the majority of traffic.
* **Timing**: Allocate higher budgets for the November-December window to capitalize on seasonal demand.

## Technical Skills Demonstrated
* **Relational Database Design**: 3NF Normalization and ER Diagramming.
* **Advanced SQL**: Complex JOINS, Aggregate Functions, GROUP BY, HAVING, and Date Formatting.
* **Data Analysis**: Transforming raw database records into actionable Business Intelligence.

---
**Project by:** PARV & AWANTIKA KHOLIA  
**Course:** Big Data Management & Analytics  
**Institution:** FORE School of Management, New Delhi
