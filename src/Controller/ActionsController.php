<?php

namespace App\Controller;

use App\Entity\Library;
use App\Form\ActionsType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Form\FormTypeInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\String\Slugger\SluggerInterface;

class ActionsController extends AbstractController
{
    #[Route('/a', name: 'home')]
    public function home()
    {
        return $this->render('base.html.twig', [
            'controller_name' => 'ActionsController',
        ]);
    }

    #[Route('/aindex', name: 'index')]
    public function index(ManagerRegistry $doctrine): Response
    {
        $actions = $doctrine->getRepository(Library::class)->findAll();
        return $this->render('actions/index.html.twig', [
            "actions" => $actions
        ]);
    }

    #[Route('/adetails/{id}', name: 'details-actions')]
    public function detailsAction($id, ManagerRegistry $doctrine): Response
    {
        $actions = $doctrine->getRepository(Library::class)->find($id);
        
        return $this->render('actions/details.html.twig', [
            "actions" => $actions
        ]);
    }

    #[Route('/adelete/{id}', name: 'delete-actions')]
    public function deleteAction($id, ManagerRegistry $doctrine): Response
    {
        $em = $doctrine->getManager();
        $actions = $doctrine->getRepository(Library::class)->find($id);
        $em->remove($actions);
        $em->flush(); 

        return $this->redirectToRoute("index");
    }
    
    // #[Route('/create', name: 'create-actions')]
    // public function createAction(Request $request): Response
    // {
    //     $actions = new Library();
    //     $form = $this->createForm(ActionsType::class, $actions);

    //     return $this->render("actions/create.html.twig", [

    //     ]);
    // }

    #[Route('/acreate', name: 'create-actions')]
    public function createAction(Request $request, ManagerRegistry $doctrine, SluggerInterface $slugger): Response
    {
        $actions = new Library();
        $form = $this->createForm(ActionsType::class, $actions);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$task` variable has also been updated
            $actions = $form->getData();
            $picture = $form->get('picture')->getData();

            if ($picture) {
                $originalFilename = pathinfo($picture->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$picture->guessExtension();
                try {
                    $picture->move(
                        $this->getParameter('picture_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }

                $actions->setPicture($newFilename);
            }

            $actions->setCreateDate(new \DateTime('now'));

            $em = $doctrine->getManager();

            $em->persist($actions);
            $em->flush();

            return $this->redirectToRoute('index');
        }

        
        return $this->render('actions/create.html.twig', [
            "form" => $form->createView()
        ]);
    }

}
