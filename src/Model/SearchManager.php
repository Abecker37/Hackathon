<?php

namespace App\Model;

use PDO;
use App\Model\AbstractManager;

class SearchManager extends AbstractManager
{
    public function findCard(array $search = []): array
    {
        $query = 'SELECT * FROM ' . CardManager::TABLE;

        if (!empty($search['title'])) {
            $query .= ' WHERE title LIKE :search';
        }

        $statement = $this->pdo->prepare($query);
        if (!empty($search['title'])) {
            $statement->bindValue(':search', '%' . $search['title'] . '%', PDO::PARAM_STR);
        }

        $statement->execute();
        return $statement->fetchAll();
    } 
}
