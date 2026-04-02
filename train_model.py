import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
import joblib

# Load dataset
data = pd.read_csv("patient_data/patient_dataset.csv")

print("Dataset rows:", len(data))

# Convert Yes/No to numbers
data["Smoking"] = data["Smoking"].map({"Yes":1,"No":0})
data["Diabetes"] = data["Diabetes"].map({"Yes":1,"No":0})

# Remove rows with missing values
data = data.dropna(subset=["Age","Smoking","Diabetes","Bone_Loss_Risk"])

print("Rows after cleaning:", len(data))

# Features
X = data[["Age","Smoking","Diabetes"]]

# Label
y = data["Bone_Loss_Risk"]

# Split dataset
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2)

# Train model
model = RandomForestClassifier()
model.fit(X_train,y_train)

# Save model
joblib.dump(model,"model.pkl")

print("Model trained successfully")