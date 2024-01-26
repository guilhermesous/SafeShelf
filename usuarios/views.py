from django.shortcuts import redirect, render


def origin(request):
    return redirect('/login')