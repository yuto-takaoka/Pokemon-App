
import Foundation

struct Result: Codable {
    let results: [Name]
}

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let types: [PokemonType]
}

struct PokemonType: Codable {
    let type: Name
}

struct Name: Codable {
    let name: String
}


class PokeAPI: ObservableObject {
    // リスト画面用
    @Published var names: [String] = []
    
    // 詳細画面用
    @Published var id: Int = 0
    @Published var name: String = ""
    @Published var types: [String] = []
    
    init() {
        fetchPokemonName()
    }
    
    // 全ポケモンの名前を取得 (リスト画面で使用)
    func fetchPokemonName() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151/") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            guard let data = data else {
                print("No data recieved")
                return
            }
            do {
                let pokemonNames = try JSONDecoder().decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self.names = pokemonNames.results.map{ $0.name }
                }
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    // 詳細データを取得
    func fetchPokemonData(id: Int) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-form/\(id)/") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            guard let data = data else {
                print("No data recieved")
                return
            }
            do {
                let pokemonData = try JSONDecoder().decode(PokemonDetail.self, from: data)
                DispatchQueue.main.async {
                    self.id = pokemonData.id
                    self.name = pokemonData.name
                    self.types = pokemonData.types.map { $0.type.name }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

