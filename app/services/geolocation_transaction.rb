# Transakcja
# Step 1 - validacja poprawności wprowadzonego ip
# Step 2 - ściągnięcie z api lokacji na podstawie wprowadzonego ip
  # http party do pobierania api.
  # w .env zdefiniować zmienną środowiskową.
  # przez zmienną środowiskową będę wołał zewnętrzny servis
# jak będę się łączył z zewnętrznym api to porobić rescue na kade statusy (obsługa błędów)
# jak zwraca inny status ni 200 to wywalam wyjątek ze statusem i wiadomością dla uytkownika
# step 3 - stworzenie obiektu który ta transakcja ma zwrócić
  class GeolocationTransaction
    include Dry::Transaction

    step :validate_ip
    step :fetch_geolocation

    def validate_ip(ip)
      IPAddr.new(ip)
      Success(ip)

      rescue IPAddr::InvalidAddressError => _error
      Failure("IP address is incorrect")
    end

    def fetch_geolocation(ip)
      # to jest obiekt który ma być stworzony
      result = {
        ip_address: ip,
        location: 'Location'
      }
      Success(result) || Failure(["Cannot fetch your location"])
    end
  end