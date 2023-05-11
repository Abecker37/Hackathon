<?php

namespace App\Controller;

use App\Model\TravelManager;

class TravelController extends AbstractController
{
    public function show(int $id): string
    {
        $travelManager = new TravelManager();
        $travel = $travelManager->selectOneById($id);

        return $this->twig->render('Home/show.html.twig', ['travel' => $travel]);
    }
}
