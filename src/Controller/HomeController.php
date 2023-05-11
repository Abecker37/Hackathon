<?php

namespace App\Controller;

use App\Model\CardManager;
use App\Model\SearchManager;

class HomeController extends AbstractController
{
    /**
     * Display home page
     */
    public function index(): string
    {
        $search = array_map('trim', $_GET);

        $cardManager = new CardManager();
        $cards = $cardManager->selectAll();

        $searchManager = new SearchManager();
        $search = $searchManager->findCard($search);

        return $this->twig->render('Home/index.html.twig', [
            'cards' => $cards, 
            'search' => $search
        ]);
    }
}
