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
        $cardManager = new CardManager();
        $cards = $cardManager->selectAll();
        return $this->twig->render('Home/index.html.twig', ['cards' => $cards]);
    }
}
