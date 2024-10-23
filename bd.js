const { MongoClient } = require('mongodb');

const url = 'mongodb://localhost:27017';
const dbName = 'manutencaoDB';

async function createDatabase() {
    const client = new MongoClient(url, { useUnifiedTopology: true });

    try {
        await client.connect();
        console.log('Conectado ao MongoDB com sucesso.');

        const db = client.db(dbName);

        // Coleção Usuarios
        const usuariosCollection = db.collection('usuarios');

        const novoUsuario = {
            id: 1,
            usuario: 'jose_silva',
            email: 'jose.silva@gmail.com'
            senha: 'senhaSegura123',
            funcao: 'Operador',
            ocupacao: 'Manutenção'
        };

        await usuariosCollection.insertOne(novoUsuario);
        console.log('Novo usuário inserido com sucesso.');

        // Coleção Equipamento
        const equipamentosCollection = db.collection('equipamentos');

        const novoEquipamento = {
            num_equipamento: 'EQ-9876',
            patrimonio: '12345',
            tipo: 'Extintor',
            capacidade: '2kg',
            prox_manutencao: new Date('2024-12-31'),
            prox_ret: new Date('2025-06-15'),
            fabricante: 'Fabricante XYZ',
            area: 'Produção',
            gerencia: 'Manutenção',
            setor: 'Mecânica',
            predio: 'A',
            local: 'Sala 101',
            selo_inmetro: 'SIM',
            nao_conformidade: 'Nenhuma',
            observacao: 'Operando normalmente',
            data_inspecao: new Date('2023-10-18')
        };

        await equipamentosCollection.insertOne(novoEquipamento);
        console.log('Novo equipamento inserido com sucesso.');

        // Coleção ManutencaoNecessaria
        const manutencaoNecessariaCollection = db.collection('manutencao_necessaria');

        const manutencaoNecessaria = {
            num_equipamento: 'EQ-9876', // Relacionamento com Equipamento
            tipo: 'Máquina',
            setor: 'Mecânica',
            predio: 'A',
            local: 'Sala 101'
        };

        await manutencaoNecessariaCollection.insertOne(manutencaoNecessaria);
        console.log('Nova manutenção necessária inserida com sucesso.');

    } catch (err) {
        console.error('Erro ao conectar ou inserir dados:', err);
    } finally {
        await client.close();
    }
}

createDatabase();
