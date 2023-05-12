<?php

namespace App\Controller;

use App\Model\CardManager;

class HomeController extends AbstractController
{
    /**
     * Display home page
     */
    public function index(): string
    {
        $search = array_map('trim', $_GET);

        $cardManager = new CardManager();
        $cards = $cardManager->findCard($search);
        return $this->twig->render('Home/index.html.twig', [
            'cards' => $cards,
            'search' => $search
        ]);
    }
}
