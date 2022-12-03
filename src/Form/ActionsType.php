<?php

namespace App\Form;

use App\Entity\Library;
use PhpParser\Node\Stmt\Label;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\ButtonTypeInterface;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Validator\Constraints\File;

class ActionsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, ["attr"=>["class"=>"form-control mb-3"]])
            ->add('description', TextareaType::class, ["attr"=>["class"=>"form-control mb-3", "style"=>"height: 120px"]])
            ->add('address', TextType::class, ["attr"=>["class"=>"form-control mb-3"]])
            ->add('capacity', NumberType::class, ["attr"=>["class"=>"form-control mb-3"]])
            ->add('contact_phone', TextType::class, ['label' => 'Phone', "attr"=>["class"=>"form-control mb-3"]])
            ->add('contact_email', TextType::class, ['label' => 'Email', "attr"=>["class"=>"form-control mb-3"]])
            ->add('url', TextType::class, ["attr"=>["class"=>"form-control mb-3"]])
            ->add('date', DateType::class, ['label' => 'Starts on:', "attr"=>["class"=>"mb-3"]])
            ->add('time', TimeType::class, ['label' => 'At:', "attr"=>["class"=>"mb-5"]])
            ->add('picture', FileType::class, [
                // 'label' =>'Picture',

                // unmapped means that this field is not associated to any entity property
                'mapped' => false,

                // make it optional so you don't have to re-upload the PDF file
                // every time you edit the Product details
                'required' => false,

                // unmapped fields can't define their validation using annotations
                // in the associated entity, so you can use the PHP constraint classes
                'constraints' => [
                    new File([
                        'maxSize' => '2048k',
                        'mimeTypes' => [
                            'image/png',
                            'image/jpg',
                            'image/jpeg',
                        ],
                        'mimeTypesMessage' => 'Please upload a valid picture document',
                    ])
                ], "attr"=>["class"=>"ms-2 mb-4", "style"=>""]
            ])
            ->add('Back', ButtonType::class, ["attr"=>[ "class"=>"btn btn-primary", "style"=>"width: 70px; float: left", "onClick"=>"window.history.back();"]])
            ->add('Ok', SubmitType::class, ["attr"=>[ "class"=>"btn btn-success", "style"=>"width: 70px; float: right"]]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Library::class
        ]);
    }
}
