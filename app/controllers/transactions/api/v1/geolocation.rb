# Transakcja
# Step 1 - validacja poprawności wprowadzonego ip
# Step 2 - ściągnięcie z api lokacji na podstawie wprowadzonego ip
  # http party do pobierania api.
  # w .env zdefiniować zmienną środowiskową.
  # przez zmienną środowiskową będę wołał zewnętrzny servis
# jak będę się łączył z zewnętrznym api to porobić rescue na kade statusy (obsługa błędów)
# jak zwraca inny status ni 200 to wywalam wyjątek ze statusem i wiadomością dla uytkownika
# step 3 - stworzenie obiektu który ta transakcja ma zwrócić