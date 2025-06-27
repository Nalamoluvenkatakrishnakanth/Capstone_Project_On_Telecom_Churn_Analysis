use churntable;

#checking the nul values in the dataset
select * from customer_data;

SELECT 
    SUM(CASE WHEN Customer_ID ='' or customer_id is null THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender ='' THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age ='' THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married ='' THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State ='' THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals ='' THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months ='' THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal ='' THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service ='' THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines ='' THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service ='' THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type ='' THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security ='' THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup ='' THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan ='' THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support ='' THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV ='' THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies ='' THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music ='' THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data ='' THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract ='' THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing ='' THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method ='' THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge ='' THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges ='' THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds ='' THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges ='' THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges ='' THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue ='' THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status ='' THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category ='' THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason ='' THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM customer_data;


#Removing Ull values from the dataset and add that values into new table 
CREATE TABLE churntable.customer_data1 AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    IF(Value_Deal = '' OR Value_Deal IS NULL, 'None', Value_Deal) AS Value_Deal,    #if the condition is true return None and otherwise return value of that col
    Phone_Service,
    IF(Multiple_Lines = '' OR Multiple_Lines IS NULL, 'No', Multiple_Lines) AS Multiple_Lines,
    Internet_Service,
    IF(Internet_Type = '' OR Internet_Type IS NULL, 'None', Internet_Type) AS Internet_Type,
    IF(Online_Security = '' OR Online_Security IS NULL, 'No', Online_Security) AS Online_Security,
    IF(Online_Backup = '' OR Online_Backup IS NULL, 'No', Online_Backup) AS Online_Backup,
    IF(Device_Protection_Plan = '' OR Device_Protection_Plan IS NULL, 'No', Device_Protection_Plan) AS Device_Protection_Plan,
    IF(Premium_Support = '' OR Premium_Support IS NULL, 'No', Premium_Support) AS Premium_Support,
    IF(Streaming_TV = '' OR Streaming_TV IS NULL, 'No', Streaming_TV) AS Streaming_TV,
    IF(Streaming_Movies = '' OR Streaming_Movies IS NULL, 'No', Streaming_Movies) AS Streaming_Movies,
    IF(Streaming_Music = '' OR Streaming_Music IS NULL, 'No', Streaming_Music) AS Streaming_Music,
    IF(Unlimited_Data = '' OR Unlimited_Data IS NULL, 'No', Unlimited_Data) AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    IF(Churn_Category = '' OR Churn_Category IS NULL, 'Others', Churn_Category) AS Churn_Category,
    IF(Churn_Reason = '' OR Churn_Reason IS NULL, 'Others', Churn_Reason) AS Churn_Reason
FROM churntable.customer_data;


#just i have done renaming to the new table
rename table customer_data1 to customer_newdata; 




#view creation
# churn and stayed
create view Churn as 
select * from customer_newdata where customer_status in ('Churned','Stayed');

#Joined view
create view joined as 
select * from customer_newdata where customer_status = 'Joined';

#dropping the view
drop view churn;

select * from joined;
select * from churn;