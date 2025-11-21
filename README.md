# Flutter + GetX Architecture 

##  Folder Structure
```
lib/
  models/       → Data structures (PostModel)
  services/     → API calls, local storage
  controllers/  → GetX logic (state, API call, favorites)
  views/        → UI screens
  widgets/      → Reusable UI components
  bindings/     → Dependency injection for controllers
  main.dart     → App entry + GetMaterialApp setup
```

---

##  How the App Works (Simple Flow)
1. **View loads** → Binding creates the controller
2. **Controller** calls **API Service** → gets data
3. Service returns JSON → converted to **Model**
4. Controller updates `.obs` reactive variables
5. UI updates automatically using **Obx()**

---

##  What Each Layer Does
### **models/**
- Data classes
- Convert JSON → Dart objects

### **services/**
- API calls (http)
- Local storage (GetStorage)

### **controllers/**
- Holds all logic
- Manages loading, error, favorites
- Updates the UI using observables

### **views/**
- UI screens only
- No logic inside UI

### **widgets/**
- Reusable components (PostCard)

### **bindings/**
- Inject controllers before screens load

### **main.dart**
- Sets up routes
- Starts GetMaterialApp



