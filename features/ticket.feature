Feature: Booking tickets
    Scenario: Should book a ticket successfully
        Given user is on "http://qamid.tmweb.ru/client/index.php" page
        When user choose day of the week ".page-nav > a:nth-child(1)"
        When user choose session time "a.movie-seances__time"
        When user choose place ".buying-scheme__wrapper > div:nth-child(3) > span:nth-child(8)"
        When user clicks the book button "button.acceptin-button"
        When user click button get booking code "button.acceptin-button"
        Then user sees the qr code and text "Покажите QR-код нашему контроллеру для подтверждения бронирования."

    Scenario: Should book two tickets for the second movie
        Given user is on "http://qamid.tmweb.ru/client/index.php" page
        When user choose day of the week ".page-nav > a:nth-child(2)"
        When user choose session time "a.movie-seances__time"
        When user choose place ".buying-scheme__wrapper > div:nth-child(7) > span:nth-child(5)"
        When user choose place ".buying-scheme__wrapper > div:nth-child(7) > span:nth-child(6)"
        When user clicks the book button "button.acceptin-button"
        When user click button get booking code "button.acceptin-button"
        Then user sees the qr code and text "Покажите QR-код нашему контроллеру для подтверждения бронирования."

    Scenario: Should not book one of the same ticket
        Given user is on "http://qamid.tmweb.ru/client/index.php" page
        When user choose day of the week ".page-nav > a:nth-child(3)"
        When user choose session time "a.movie-seances__time"
        When user choose place ".buying-scheme__wrapper > div:nth-child(8) > span:nth-child(3)"
        When user clicks the book button "button.acceptin-button"
        When user click button get booking code "button.acceptin-button"
        When user sees the qr code and text "Покажите QR-код нашему контроллеру для подтверждения бронирования."
        When user reopens page "http://qamid.tmweb.ru/client/index.php"
        When user choose day of the week ".page-nav > a:nth-child(3)"
        When user choose session time "a.movie-seances__time"
        When user choose place ".buying-scheme__wrapper > div:nth-child(8) > span:nth-child(3)"
        Then button for booking is inactive "true"