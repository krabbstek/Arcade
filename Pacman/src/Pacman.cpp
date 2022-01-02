#include <iostream>
#include <SDL.h>
#include <SDL_image.h>

SDL_Texture* LoadSpritesheet(SDL_Renderer* renderer, const char* path)
{
    SDL_Surface* surface = IMG_Load(path);
    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surface);
    SDL_SetTextureBlendMode(texture, SDL_BLENDMODE_BLEND);
    SDL_FreeSurface(surface);
    return texture;
}

int main(int argc, const char* argv[])
{
    int initResult;

    initResult = SDL_Init(SDL_INIT_EVERYTHING);
    if (initResult)
    {
        std::cerr << "Failed to initialize SDL\n";
        goto Exit;
    }

    SDL_Window* window;
    SDL_Renderer* renderer;
    constexpr int width = 480;
    constexpr int height = 480;
    uint32_t flags = 0;
    initResult = SDL_CreateWindowAndRenderer(width, height, flags, &window, &renderer);
    if (initResult)
    {
        std::cerr << "Failed to create SDL window and renderer\n";
        goto SDL_Quit;
    }
    SDL_SetWindowTitle(window, "Pacman");
    SDL_SetRenderDrawBlendMode(renderer, SDL_BLENDMODE_BLEND);

    SDL_Texture* spritesheet = LoadSpritesheet(renderer, "res/spritesheet.png");

    bool running = true;
    SDL_Event sdlEvent;
    while (running)
    {
        while (SDL_PollEvent(&sdlEvent))
        {
            switch (sdlEvent.type)
            {
            case SDL_QUIT:
                running = false;
                break;
            }
        }

        SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0x00, 0x00);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, spritesheet, NULL, NULL);
        SDL_RenderPresent(renderer);
    }

SDL_DestroyWindow:
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

SDL_Quit:
    SDL_Quit();
    
Exit:
    return initResult;
}
