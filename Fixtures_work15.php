<?php
declare(strict_types=1);
class Fixtures_work15
{
    /**
     * @var PDO $connection
     */
    private static $connection;
    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();
        try {
            $connection->beginTransaction();
            $this->cleanup();

            $this->generateEmployee(51);
            $this->generateTransport(51);
            $this->generateSalarys(100000);
            $this->generateIncome(500000);

            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function getRandomName(): string
    {
        static $randomNames = ['Norbert','Damon','Laverna','Annice','Brandie','Emogene','Cinthia','Magaret','Daria','Ellyn','Rhoda','Debbra','Reid','Desire','Sueann','Shemeka','Julian','Winona','Billie','Michaela','Loren','Zoraida','Jacalyn','Lovella','Bernice','Kassie','Natalya','Whitley','Katelin','Danica','Willow','Noah','Tamera','Veronique','Cathrine','Jolynn','Meridith','Moira','Vince','Fransisca','Irvin','Catina','Jackelyn','Laurine','Freida','Torri','Terese','Dorothea','Landon','Emelia'];
        return $randomNames[array_rand($randomNames)];
    }

    private function getRandomLastName(): string
    {
        static $randomLastNames = ['Smith', 'Johnson','Williams','Brown','Jones','Miller','Davis','Garcia','Rodriguez','Wilson','Martinez','Anderson','Taylor','Thomas','Hernandez','Moore','Martin'.'Jackson','Thompson','White','Lopez','Lee','Gonzalez','Harris','Clark','Lewis','Robinson','Walker','Perez','Hall','Young','Allen','Sanchez','Wright','King'.'Scott','Green','Baker','Adams','Nelson','Hill','Ramirez','Campbell','Mitchell','Roberts','Carter','Phillips','Evans','Turner','Torres','Parker','Collins'];
        return $randomLastNames[array_rand($randomLastNames)];
    }

    private function getRandomTransportNumber(): string
    {
        return uniqid();
    }

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=work13', 'work13', 'work13', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return self::$connection;
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();

        $connection->exec('DELETE FROM employe WHERE employe_id > 10');
        $connection->exec('ALTER TABLE employe AUTO_INCREMENT = 11');

        $connection->exec('DELETE FROM transport WHERE transport_id > 15');
        $connection->exec('ALTER TABLE transport AUTO_INCREMENT = 16');

        $connection->exec('DELETE FROM salary WHERE item_id > 30');
        $connection->exec('ALTER TABLE salary AUTO_INCREMENT = 31');

    }

    /**
     * @param int $usersCount
     * @throws Exception
     */
    public function generateEmployee(int $usersCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE Employee ===
        $start = microtime(true);

        $first_name = $last_name = $birthday = '';
        $minAgeTimestamp = $currentTimestamp - (31556952 * 45);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 16);

        $statement = $connection->prepare(<<<SQL
    INSERT INTO employe (first_name, last_name, birthday)
    VALUES (:first_name, :last_name, :birthday);
 SQL
        );

        $statement->bindParam(':first_name', $first_name);
        $statement->bindParam(':last_name', $last_name);
        $statement->bindParam(':birthday', $birthday);

        for ($userId = 11; $userId < $usersCount; $userId++) {
            $first_name = $this->getRandomName();
            $last_name = $this->getRandomLastName();
            $timestamp = random_int($minAgeTimestamp, $maxAgeTimestamp);
            $birthday = date('Y-m-d', $timestamp);
            $statement->execute();
        }
        echo 'Create employees: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $transportsCount
     * @throws Exception
     */
    public function generateTransport(int $transportsCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE Transport ===
        $start = microtime(true);

        $transport_type_id = $transport_number = '';

        $statement = $connection->prepare(<<<SQL
    INSERT INTO transport (transport_type_id, transport_number)
    VALUES (:transport_type_id, :transport_number);
 SQL
        );

        $statement->bindParam(':transport_type_id', $transport_type_id);
        $statement->bindParam(':transport_number', $transport_number);

        for ($traportId = 11; $traportId < $transportsCount; $traportId++) {
            $transport_type_id = random_int(1, 3);
            $transport_number = $this->getRandomTransportNumber();

            $statement->execute();
        }
        echo 'Create Transport: ' . (microtime(true) - $start) . "\n";
    }

     /**
     * @param int $salarysCount
     * @throws Exception
     */
    public function generateSalarys(int $salarysCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE Salarys ===
        $start = microtime(true);

        $salary_date = $employe_id = $salary_sum = '';

        $statement = $connection->prepare(<<<SQL
    INSERT INTO salary (salary_date, employe_id, salary_sum)
    VALUES (:salary_date, :employe_id, :salary_sum);
 SQL
        );

        $statement->bindParam(':salary_date', $salary_date);
        $statement->bindParam(':employe_id', $employe_id);
        $statement->bindParam(':salary_sum', $salary_sum);

        for ($itemId = 11; $itemId < $salarysCount; $itemId++) {
            $employe_id = random_int(1, 50);
            $salary_sum = random_int(1000, 100000);

            $timestamp = random_int($currentTimestamp - 31556952*20, $currentTimestamp);
            $salary_date = date('Y-m-d', $timestamp);

            $statement->execute();
        }
        echo 'Create salary: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $incomsCount
     * @throws Exception
     */
    public function generateIncome(int $incomsCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE INCOMES ===
        $start = microtime(true);

        $income_date = $employe_id = $transport_id = $income_sum = '';

        $statement = $connection->prepare(<<<SQL
    INSERT INTO income (income_date, employe_id, transport_id, income_sum)
    VALUES (:income_date, :employe_id, :transport_id, :income_sum)
SQL
        );

        $statement->bindParam(':income_date', $income_date);
        $statement->bindParam(':employe_id', $employe_id);
        $statement->bindParam(':transport_id', $transport_id);
        $statement->bindParam(':income_sum', $income_sum);

        for ($itemId = 31; $itemId < $incomsCount; $itemId++) {
            $employe_id = random_int(1, 50);
            $transport_id = random_int(1, 50);
            $income_sum = random_int(50000, 100000);

            $timestamp = random_int($currentTimestamp - 31556952*20, $currentTimestamp);
            $income_date = date('Y-m-d', $timestamp);

            $statement->execute();
        }

        echo 'Create incomes: ' . (microtime(true) - $start) . "\n";
    }
}

$fixturesGenerator = new Fixtures_work15();
$fixturesGenerator->generate();