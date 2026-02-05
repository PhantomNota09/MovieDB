//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Surya Rayala on 2/3/26.
//

import Foundation

// MARK: - Movie View Model
final class MovieViewModel {
    
    // MARK: - Properties
    
    /// Array of movie models
    private(set) var movies: [MovieModel] = []
    
    /// Computed property for the number of movies
    var numberOfMovies: Int {
        return movies.count
    }
    
    // MARK: - Data Loading
    
    /// Loads movie data from the mock data source
    func loadMovies() {
        movies = generateMockData()
    }
    
    /// Retrieves a movie at a specific index
    func movie(at index: Int) -> MovieModel? {
        guard index >= 0 && index < movies.count else {
            return nil
        }
        return movies[index]
    }
    
    // MARK: - Formatting Methods
    
    /// Formats a title with prefix
    func formatTitle(_ title: String) -> String {
        return "Title: \(title)"
    }
    
    /// Formats a popularity score
    func formatPopularityScore(_ score: Double) -> String {
        return "Popularity Score: \(score)"
    }
    
    /// Formats a release year
    func formatReleaseYear(_ year: Int) -> String {
        return "Release Year: \(year)"
    }
    
    /// Formats a rating value
    func formatRating(_ rating: Double) -> String {
        return "Rating: \(rating)/10"
    }
    
    /// Formats a release date with prefix
    func formatReleaseDate(_ date: String) -> String {
        return "Release Date: \(date)"
    }
    
    /// Formats vote count with thousands separator
    func formatVoteCount(_ count: Int) -> String {
        return "Vote Count: \(count.formatted())"
    }
    
    /// Formats genre ID for display
    func formatGenreId(_ id: Int) -> String {
        return "Genre ID: \(id)"
    }
    
    // MARK: - Mock Data Generation
    
    /// Generates mock movie data for testing and development purposes
    private func generateMockData() -> [MovieModel] {
        return [
            MovieModel(
                title: "Ad Astra",
                popularityScore: 176.674,
                releaseYear: 2019,
                imageName: "star.fill",
                plotDescription: "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. Astronaut Roy McBride undertakes a mission across an unforgiving solar system to uncover the truth about his missing father and his doomed expedition that now, 30 years later, threatens the universe. His journey will uncover secrets that challenge the nature of human existence and our place in the cosmos. Along the way, Roy must confront the demons of his past while facing the vast emptiness of space. The mission tests not only his technical skills but his emotional resilience. He discovers that the greatest frontier isn't outer space, but the unexplored territory within ourselves. This epic journey becomes a meditation on what it means to be human in an infinite universe. The film explores themes of isolation, legacy, and the price of obsession.",
                rating: 7.9,
                releaseDate: "2019-02-08",
                voteCount: 5000,
                genreId: 878
            ),
            MovieModel(
                title: "Avatar",
                popularityScore: 144.444,
                releaseYear: 2009,
                imageName: "leaf.fill",
                plotDescription: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission. Jake Sully finds himself torn between following orders and protecting the world he feels is his home when he learns about a beautiful alien civilization. The Na'vi, a sentient humanoid species native to Pandora, live in harmony with their environment, connected through a neural network to all living things. As Jake, through his avatar body, integrates into the Na'vi clan, he begins to understand their deep spiritual connection to their world. The Resources Development Administration seeks to mine Pandora's valuable mineral deposits, threatening to destroy the Na'vi's sacred lands. Jake must make a choice between his loyalty to his own species and doing what's right. The film revolutionized cinema with its groundbreaking visual effects and motion capture technology. It tells a powerful story about environmentalism, imperialism, and the clash between industrial progress and indigenous rights.",
                rating: 8.0,
                releaseDate: "2009-12-02",
                voteCount: 20000,
                genreId: 878
            ),
            MovieModel(
                title: "The Lion King",
                popularityScore: 123.456,
                releaseYear: 1994,
                imageName: "crown.fill",
                plotDescription: "A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery. Simba idolizes his father, King Mufasa, and takes to heart his own royal destiny on the plains of Africa. But when tragedy strikes, orchestrated by his treacherous uncle Scar, Simba is led to believe he caused his father's death. Consumed by guilt, he runs away from the Pride Lands, abandoning his rightful place as king. In exile, he befriends the comedic meerkat Timon and the warmhearted warthog Pumbaa, adopting their carefree \"Hakuna Matata\" philosophy. Years pass as Simba grows into adulthood, trying to escape his past and responsibilities. However, when his childhood friend Nala finds him and reveals the devastation Scar has brought upon the Pride Lands, Simba must confront his past. The film explores powerful themes of identity, loss, redemption, and the circle of life. It remains one of the most beloved animated films of all time, featuring unforgettable music and timeless life lessons.",
                rating: 8.8,
                releaseDate: "1994-02-11",
                voteCount: 15000,
                genreId: 16
            ),
            MovieModel(
                title: "Inception",
                popularityScore: 198.532,
                releaseYear: 2010,
                imageName: "brain.head.profile",
                plotDescription: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O. Dom Cobb is a skilled extractor, the best in the dangerous art of navigating the subconscious during the dream state when the mind is most vulnerable. His rare ability has made him a coveted player in the world of corporate espionage but has also cost him everything he loves. Cobb is offered a chance at redemption when he's tasked with performing inception—planting an idea rather than stealing one. If successful, this job could give him his life back, but it requires assembling the perfect team. The team must pull off the reverse heist by navigating multiple dream levels, where the laws of physics don't apply and time moves differently. As they go deeper into the dream world, the line between reality and dreams begins to blur dangerously. Cobb's own subconscious projections threaten to sabotage the mission at every turn. The film is a mind-bending thriller that questions the nature of reality itself. It combines stunning visual effects with a complex, layered narrative that demands multiple viewings.",
                rating: 8.8,
                releaseDate: "2010-07-16",
                voteCount: 32000,
                genreId: 878
            ),
            MovieModel(
                title: "The Dark Knight",
                popularityScore: 210.987,
                releaseYear: 2008,
                imageName: "moon.stars.fill",
                plotDescription: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice. With the help of Lieutenant Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations plaguing the city. The partnership proves effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known only as the Joker. The Joker seeks to prove that even the most righteous person can be corrupted, specifically targeting Harvey Dent as Gotham's white knight. As the Joker's terrorism escalates, Batman is forced to confront everything he believes about heroism and sacrifice. The film explores the thin line between hero and vigilante, order and chaos, justice and revenge. Heath Ledger's iconic performance as the Joker redefined the superhero genre. The movie raises profound questions about what people are willing to sacrifice for the greater good. It stands as a dark, gritty crime thriller that transcends its comic book origins.",
                rating: 9.0,
                releaseDate: "2008-07-18",
                voteCount: 28000,
                genreId: 28
            ),
            MovieModel(
                title: "Interstellar",
                popularityScore: 189.234,
                releaseYear: 2014,
                imageName: "sparkles",
                plotDescription: "In Earth's future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable. Professor Brand, a brilliant NASA physicist, is working on plans to save mankind by transporting Earth's population to a new home via a wormhole. Cooper, an ex-science engineer and pilot, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans. The mission takes the crew through the wormhole to three potentially habitable planets orbiting a supermassive black hole. Time dilation becomes a critical factor as hours on distant planets equal years back on Earth. Cooper must make heart-wrenching decisions between seeing his children again and the future of the human race. The film beautifully explores the bonds between parents and children across vast distances of space and time. With stunning visuals and scientifically grounded concepts, it contemplates humanity's place in the universe. The story is both an epic space adventure and an intimate family drama about love transcending dimensions.",
                rating: 8.6,
                releaseDate: "2014-11-07",
                voteCount: 35000,
                genreId: 878
            ),
            MovieModel(
                title: "Parasite",
                popularityScore: 167.890,
                releaseYear: 2019,
                imageName: "house.fill",
                plotDescription: "The Kim family, all unemployed, live in a squalid basement apartment in South Korea. When the son, Ki-woo, gets an opportunity to tutor the daughter of the wealthy Park family, he recommends his sister as an art therapist. Soon, the entire Kim family has infiltrated the Park household by posing as unrelated, highly qualified professionals. The two families, representing opposite ends of the social spectrum, become entangled in an increasingly dangerous relationship. As the Kims enjoy their newfound affluence, they remain unaware of a dark secret hidden in the Parks' basement. The precarious balance between the two families begins to unravel with devastating consequences. This masterful thriller brilliantly satirizes class discrimination and wealth inequality in modern society. The film seamlessly blends genres, shifting from comedy to horror to tragedy. It became the first South Korean film to win the Palme d'Or and later won Best Picture at the Academy Awards.",
                rating: 8.5,
                releaseDate: "2019-05-30",
                voteCount: 24000,
                genreId: 53
            ),
            MovieModel(
                title: "The Shawshank Redemption",
                popularityScore: 156.789,
                releaseYear: 1994,
                imageName: "building.columns.fill",
                plotDescription: "In 1947, banker Andy Dufresne is sentenced to life in Shawshank State Penitentiary for the murders of his wife and her lover, despite his claims of innocence. Over the following two decades, he befriends fellow inmate Red, a contraband smuggler serving a life sentence. Andy maintains his innocence but remains stoic and adapts to prison life, even using his banking skills to win favor with the guards and warden. He begins a friendship with Red that changes both their lives forever. Despite the brutal realities of prison life and the corruption of the guards, Andy never loses hope. He slowly works on a secret project that takes years to complete. The film explores themes of hope, friendship, and the resilience of the human spirit in the face of injustice. Red learns from Andy that hope is a good thing, maybe the best of things, and no good thing ever dies. It has become one of the most beloved films of all time, consistently ranking at the top of movie lists.",
                rating: 9.3,
                releaseDate: "1994-09-23",
                voteCount: 40000,
                genreId: 18
            )
        ]
    }
}
