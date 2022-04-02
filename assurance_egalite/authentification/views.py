from django.shortcuts import render, redirect
from django.conf import settings
from django.contrib.auth import login

from . import forms # importation du formulaire d'inscription


def page_inscription(request):
    form = forms.SignupForm()
    if request.method == 'POST':
        form = forms.SignupForm(request.POST)
        if form.is_valid():
            user = form.save() # sauvegarder le nouvelle utilisateur dans la base de donnees

            login(request, user) # le logger directement apres inscription
            return redirect(settings.LOGIN_REDIRECT_URL) # redirection vers la page d'acceuil du site

    return render(request, 'authentification/inscription.html', context={'form' : form})
