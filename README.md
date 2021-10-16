# Air Quality Analyzer - *By Υδρόγειος Education CODELAB*
Ένα από τα μεγαλύτερα προβλήματα των μεγάλων αστικών περιοχών είναι η ατμοσφαιρική ρύπανση. Με τον όρο ατμοσφαιρική ρύπανση, εννοούμε την προσθήκη ουσιών στην ατμόσφαιρα, που υπό φυσιολογικές συνθήκες δε θα υπήρχαν. Πολλές από αυτές τις ουσίες είναι βλαβερές όχι μόνο για τον ανθρώπινο, αλλά και για πολλούς άλλους ζωντανούς οργανισμούς. Τα αποτελέσματα της έκθεσής τους στους ρύπους αυτούς λειτουργούν αθροιστικά σε αυτούς. Όσο μεγαλύτερη είναι η έκθεση σε αυτές, τόσο μεγαλύτερες και οι βλάβες που μπορεί να προκληθούν. 

Η ατμοσφαιρική ρύπανση που οφείλεται σε ανθρωπογενείς πηγές, αποτελεί ένα σημαντικό περιβαλλοντικό πρόβλημα, με επιπτώσεις στην υγεία. Τα **αιωρούμενα σωματίδια** που είναι αποτέλεσμα της καύσης βιομάζας και ορυκτών καυσίμων, ιδιαίτερα από τα νοικοκυριά όταν έχουμε χαμηλές θερμοκρασίες, αναγνωρίζονται ως κάποιους από τους σημαντικότερους ρύπους από την άποψη των επιπτώσεων για την υγεία.

Παράλληλα, διαπιστώθηκε ότι η συχνότητα εμφάνισης έντονου **θερμικού στρες** (η αντίδραση του οργανισμού στην εξωτερική θερμοκρασία, όταν αυτή είναι χαμηλότερη ή υψηλότερη από την επιθυμητή) είναι στην Αθήνα δύο έως τρεις φορές μεγαλύτερη από τα τέλη της δεκαετίας του 1990 και μετά, σε σχέση με τις προηγούμενες δεκαετίες.

Στόχος του έργου μας, είναι να κάνουμε μια μελέτη σύγκρισης της ποιότητας του αέρα σε σχολικές μονάδες. Η ανάλυση των δεδομένων που θα συλλέξουμε, έχει πρωταρχικό στόχο την κατάταξη των σχολείων αυτών ως προς την ατμοσφαιρική ρύπανση και τη θερμική δυσφορία που είναι πιθανό κανείς να βιώσει, ώστε να μπορούμε εύκολα να αναγνωρίζουμε τα πιο ανθυγιεινά σχολικά περιβάλλοντα, αρχικά για την ενημέρωση και στη συνέχεια για την εύρεση τρόπων βελτίωσής τους. Έτσι, θα μπορούμε να προστατεύσουμε τις ευπαθείς ομάδες παρέχοντάς τες αναλυτικές πληροφορίες για την ποιότητα του αέρα ενός χώρου. Εάν γίνει μια κατάταξη των σχολείων σύμφωνα με τους δείκτες ποιότητας του αέρα που εισπνέουμε, θα δημοσιεύσουμε τις μετρήσεις ώστε να βοηθήσουμε την πολιτεία να πάρει μέτρα - όπου χρειάζεται,  για τη βελτίωση τους.

Με το έργο μας ευελπιστούμε να τοποθετηθούν σε κάθε σχολείο και οπουδήποτε αλλού κριθεί αναγκαίο για την προστασία των ευπαθών ομάδων, παρόμοιοι σταθμοί μέτρησης, ώστε να υπάρχει συνεχής παρακολούθηση του επιπέδου ρύπανσης της ατμόσφαιρας.

<img src="https://openedtech.ellak.gr/wp-content/uploads/sites/31/2021/10/diagram.jpg"/>

**Τα υλικά που χρησιμοποιήσαμε:**

  * Για την κατασκευή του μετρητή:
    * Raspberry Pi 3 -- **41€**
    * DHT11 Humidity & Temperature Sensor -- **5€**
    * Particulate Matter Sensor PMS5003 -- **29€**
   
  * Για την κατασκευή του Server και της βάσης δεδομένων:
    * Raspberry Pi 4 -- **56€**
  
**Το λογισμικό που χρησιμοποιήσαμε:**

  * Για τον προγραμματισμό του μετρητή:
    * Python
   
  * Για τον προγραμματισμό του Server και της βάσης δεδομένων:
    * Apache
    * MySQL

**Τιμές δείκτη ποιότητας αέρα:**

* Καλή: **0-10**

* Ικανοποιητική: **10-20**

* Μέτρια: **20-25**

* Κακή: **25-50**

* Πολύ-κακή: **50+**

## Frontend page
Η ιστοσελίδα αυτής της εργασίας που μπορεί να βρεθεί [εδώ](https://lessons.idrogios.com/) αποσκοπεί να αναπαραστήσει τις μετρήσεις κάθε σχολείου και να διευκολύνει την κατανόησή τους.

Συγκεκριμένα, υπάρχουν 4 γραφήματα για να αναπαρασταθούν και να συκγριθούν ανάμεσα στα σχολεία:
* Αιωρούμενων σωματιδίων μεγέθους 2.5 μικρομέτρων
* Αιωρούμενων σωματιδίων μεγέθους 10 μικρομέτρων
![Σωματίδια σε σύγκριση με μία ανθρώπινη τρίχα](https://www.epa.gov/sites/default/files/styles/medium/public/2016-09/pm2.5_scale_graphic-color_2.jpg)
* Θερμοκρασίας
* Υγρασίας

Καθώς και ένας χάρτης όπου απεικονίζεται η τοποθεσία κάθε σχολείου ως μία καρφίτσα, με το πάτημα (click) της οποίας αποκρύπτονται ή εμφανίζονται οι μετρικές του αντίστοιχου σχολείου στα γραφήματα.

**Οι βιβλιοθήκες που χρησιμοποιούνται:**
* tachyons (generic CSS)
* cash (generic JS)
* leaflet (JS + CSS, δημιουργία χάρτη)
* d3 και c3 (JS + CSS, δημιουργία γραφημάτων)

## Οδηγίες για το πώς να εννωθούν οι αισθητήρες και για τη χρήση του κώδικα στο Raspberry Pi
<img src="https://openedtech.ellak.gr/wp-content/uploads/sites/31/2021/09/Air_Quality_Analyzer_PCB_Layout-1024x961.png" alt="PCB Layout" width="500"/>

### Για τον DHT11:
* Η βιβλιοθήκη που χρησιμοποιείται: https://github.com/adafruit/Adafruit_Python_DHT
* Η ακίδα με όνομα ***"VCC"***, θα πρέπει να ενωθεί στα **3.3V** από τις ακίδες του Raspberry
* Η ακίδα με όνομα ***"DATA"***, θα πρέπει να ενωθεί στο **GPIO4** από τις ακίδες του Raspberry
* Η ακίδα με όνομα ***"GND"***, θα πρέπει να ενωθεί σε μία από τις ακίδες **Ground** του Raspberry

### Για τον PMS5003:
* Η βιβλιοθήκη που χρησιμοποιείται: https://github.com/pimoroni/pms5003-python
* Πρώτα επιβεβαιώστε το pinout του αισθητήρα που θα βρείτε εδώ: https://www.aqmd.gov/docs/default-source/aq-spec/resources-page/plantower-pms5003-manual_v2-3.pdf#page=4

Ύστερα:
* Η έξοδος του αισθητήρα ***"VCC"***, θα πρέπει να ενωθεί σε μία από τις ακίδες **5V** του Raspberry
* Η έξοδος του αισθητήρα ***"GND"***, θα πρέπει να ενωθεί σε μία από τις ακίδες **Ground** του Raspberry
* Η έξοδος του αισθητήρα ***"SET"***, θα πρέπει να ενωθεί με μία **PULL_UP** αντίσταση **10ΚΩ** στα **3.3V** από τις ακίδες του Raspberry
* Η έξοδος του αισθητήρα ***"RX"***, θα πρέπει να ενωθεί στο **GPIO14(TXD)** από τις ακίδες του Raspberry
* Η έξοδος του αισθητήρα ***"TX"***, θα πρέπει να ενωθεί στο **GPIO15(RXD)** από τις ακίδες του Raspberry
* Η έξοδος του αισθητήρα ***"RESET"***, θα πρέπει να ενωθεί με μία **PULL_UP** αντίσταση **10ΚΩ** στα **3.3V** από τις ακίδες του Raspberry

### Ο χρήστης θα πρέπει: 
* Πρώτα, αφού βρεθεί στις γραμμές **31** και **37** του αρχείου ***AirQuality.py***, να ακολουθήσει τις οδηγίες για την εγκατάσταση των δύο αυτών βιβλιοθηκών από το **Raspberry**
* Μετά, να ανοίξει την κονσόλα του **Raspberry**
* Ύστερα να κατευθυνθεί στη διεύθυνση που βρίσκεται το αρχείο ***AirQuality.py***
* Κατόπιν θα πρέπει να γράψει: `sudo python AirQuality.py`
* Αφού εμφανιστεί ένα πεδίο ***"Enter the Username:"***, θα πρέπει να πληκτρολογήσει το **Username** που έχει εισάγει στη βάση δεδομένων του
* Τέλος, αφού εμφανιστεί το πεδίο ***"Enter the Password"***, ο χρήστης θα πρέπει να πληκτρολογήσει τον κωδικό που αντιστοιχεί στο **Username** που συμπλήρωσε παραπάνω

## Η ομάδα *CODELAB*:
* **Μελάς Γιώργος (Επιβλέπων)**
* **Γκανάτσας Παντελής**
* **Καλλίνος Στράτος**
* **Σακελλαρίου Φίλιππος**
* **Σεϊτάνης Αθανάσιος**
* **Σισκούδης Άνθιμος**
* **Παπαστογιαννίδης Αναστάσης**
* **Παπαχρήστος Αρσένης** 
