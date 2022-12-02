<?php

namespace App\Controller;

use App\Entity\Library;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;

class ActionsController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home()
    {
        return $this->render('base.html.twig', [
            'controller_name' => 'ActionsController',
        ]);
    }

    #[Route('/index', name: 'index')]
    public function index(ManagerRegistry $doctrine): Response
    {
        $actions = $doctrine->getRepository(Library::class)->findAll();
        return $this->render('actions/index.html.twig', [
            "actions" => $actions
        ]);
    }
}
