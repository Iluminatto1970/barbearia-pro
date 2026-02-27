<?php
if (!defined('SAAS_ADMIN_APP')) {
    exit;
}

$action = $_GET['action'] ?? '';

if ($action === 'get' && isset($_POST['id'])) {
    $query = $pdo_saas->prepare("SELECT * FROM sistemas WHERE id = ?");
    $query->execute([$_POST['id']]);
    $data = $query->fetch(PDO::FETCH_ASSOC);
    echo json_encode($data);
    exit;
}

if ($action === 'save' && $_POST) {
    $id = $_POST['id'] ?? '';
    $nome = $_POST['nome'];
    $slug = $_POST['slug'];
    $descricao = $_POST['descricao'] ?? '';
    $pasta = $_POST['pasta'];
    $banco = $_POST['banco'];
    $db_host = $_POST['db_host'] ?? '127.0.0.1';
    $db_usuario = $_POST['db_usuario'];
    $db_senha = $_POST['db_senha'] ?? '';
    
    if ($id) {
        $query = $pdo_saas->prepare("UPDATE sistemas SET nome=?, slug=?, descricao=?, pasta=?, banco_dados=?, db_host=?, db_usuario=?, db_senha=? WHERE id=?");
        $query->execute([$nome, $slug, $descricao, $pasta, $banco, $db_host, $db_usuario, $db_senha, $id]);
    } else {
        $query = $pdo_saas->prepare("INSERT INTO sistemas (nome, slug, descricao, pasta, banco_dados, db_host, db_usuario, db_senha) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $query->execute([$nome, $slug, $descricao, $pasta, $banco, $db_host, $db_usuario, $db_senha]);
    }
    echo 'Salvo com Sucesso';
    exit;
}

if ($action === 'delete' && isset($_POST['id'])) {
    $query = $pdo_saas->prepare("DELETE FROM sistemas WHERE id = ?");
    $query->execute([$_POST['id']]);
    echo 'Excluido com Sucesso';
    exit;
}
?>
<style>
    .system-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
        gap: 20px;
        margin-top: 20px;
    }
    .system-card {
        background: #fff;
        border-radius: 16px;
        border: 1px solid var(--border);
        overflow: hidden;
        transition: transform 0.2s, box-shadow 0.2s;
    }
    .system-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    }
    .system-header {
        padding: 16px 20px;
        background: linear-gradient(135deg, #0f766e, #14b8a6);
        color: white;
    }
    .system-header h4 { margin: 0; font-size: 1.1rem; }
    .system-header small { opacity: 0.8; }
    .system-body { padding: 16px 20px; }
    .system-stat {
        display: flex;
        justify-content: space-between;
        padding: 8px 0;
        border-bottom: 1px solid #f0f0f0;
    }
    .system-stat:last-child { border-bottom: none; }
    .system-stat label { color: #64748b; font-size: 0.85rem; }
    .system-stat value { font-weight: 600; }
    .system-actions {
        padding: 12px 20px;
        background: #f8fafc;
        display: flex;
        gap: 8px;
    }
    .tunnel-list { margin-top: 12px; }
    .tunnel-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 8px 12px;
        background: #f1f5f9;
        border-radius: 8px;
        margin-bottom: 6px;
        font-size: 0.85rem;
    }
    .tunnel-item.online { border-left: 3px solid #10b981; }
    .tunnel-item.offline { border-left: 3px solid #ef4444; }
    .tunnel-url { font-family: monospace; color: #0f766e; }
    .tunnel-port { color: #64748b; }
</style>

<?php
$query = $pdo_saas->query("SELECT * FROM sistemas ORDER BY nome ASC");
$sistemas = $query->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="mb-0"><i class="fa fa-layer-group text-teal mr-2"></i>Sistemas Cadastrados</h4>
    <button class="btn btn-primary" onclick="novoSistema()">
        <i class="fa fa-plus"></i> Novo Sistema
    </button>
</div>

<div class="system-grid">
    <?php foreach ($sistemas as $sis): ?>
        <?php
        $query = $pdo_saas->query("SELECT COUNT(*) FROM empresas WHERE sistema_id = '{$sis['id']}'");
        $total_empresas = $query->fetchColumn();
        
        $query = $pdo_saas->query("SELECT COUNT(*) FROM empresas WHERE sistema_id = '{$sis['id']}' AND ativo = 'Sim'");
        $empresas_ativas = $query->fetchColumn();
        
        $tunnel_file = '/home/iluminatto/Documents/Dev/' . $sis['pasta'] . '/app/app/sistema/saas/tunnels';
        $tunnels = [];
        if (is_dir($tunnel_file)) {
            $files = glob($tunnel_file . '/*.yml');
            foreach ($files as $file) {
                $content = file_get_contents($file);
                preg_match('/hostname:\s*(.+)/', $content, $match);
                $tunnels[] = [
                    'nome' => basename($file, '.yml'),
                    'hostname' => isset($match[1]) ? trim($match[1]) : 'N/A'
                ];
            }
        }
        ?>
        <div class="system-card">
            <div class="system-header">
                <h4><i class="fa fa-<?= $sis['slug'] == 'barbearia' ? 'cut' : 'comments' ?> mr-2"></i><?= htmlspecialchars($sis['nome']) ?></h4>
                <small><?= htmlspecialchars($sis['slug']) ?></small>
            </div>
            <div class="system-body">
                <div class="system-stat">
                    <label>Empresas</label>
                    <value><?= $total_empresas ?></value>
                </div>
                <div class="system-stat">
                    <label>Ativas</label>
                    <value class="text-success"><?= $empresas_ativas ?></value>
                </div>
                <div class="system-stat">
                    <label>Pasta</label>
                    <value><small><?= htmlspecialchars($sis['pasta']) ?></small></value>
                </div>
                
                <?php if (!empty($tunnels)): ?>
                <div class="tunnel-list mt-3">
                    <small class="text-muted font-weight-bold">Túneis</small>
                    <?php foreach ($tunnels as $tun): ?>
                    <div class="tunnel-item online">
                        <span class="tunnel-url"><?= htmlspecialchars($tun['hostname']) ?></span>
                        <span class="tunnel-port"><i class="fa fa-link"></i></span>
                    </div>
                    <?php endforeach; ?>
                </div>
                <?php endif; ?>
            </div>
            <div class="system-actions">
                <a href="?page=empresas&sistema=<?= $sis['id'] ?>" class="btn btn-sm btn-soft">
                    <i class="fa fa-building"></i> Empresas
                </a>
                <button class="btn btn-sm btn-soft" onclick="editarSistema(<?= $sis['id'] ?>)">
                    <i class="fa fa-edit"></i>
                </button>
                <button class="btn btn-sm btn-soft text-danger" onclick="excluirSistema(<?= $sis['id'] ?>)">
                    <i class="fa fa-trash"></i>
                </button>
            </div>
        </div>
    <?php endforeach; ?>
</div>

<!-- Modal Novo Sistema -->
<div class="modal" id="modalSistema" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Novo Sistema</h5>
                <button type="button" class="close" onclick="$('#modalSistema').modal('hide')">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formSistema">
                    <input type="hidden" name="id" id="sis_id">
                    <div class="form-group">
                        <label>Nome do Sistema</label>
                        <input type="text" class="form-control" name="nome" id="sis_nome" required>
                    </div>
                    <div class="form-group">
                        <label>Slug (identificador)</label>
                        <input type="text" class="form-control" name="slug" id="sis_slug" required placeholder="barberia, chat, etc">
                    </div>
                    <div class="form-group">
                        <label>Descrição</label>
                        <textarea class="form-control" name="descricao" id="sis_descricao" rows="2"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Pasta do Projeto</label>
                        <input type="text" class="form-control" name="pasta" id="sis_pasta" required placeholder="Barbearia PRO/app">
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Banco de Dados</label>
                                <input type="text" class="form-control" name="banco" id="sis_banco" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>DB Host</label>
                                <input type="text" class="form-control" name="db_host" id="sis_db_host" value="127.0.0.1">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>DB Usuário</label>
                                <input type="text" class="form-control" name="db_usuario" id="sis_db_usuario" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>DB Senha</label>
                                <input type="text" class="form-control" name="db_senha" id="sis_db_senha">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="$('#modalSistema').modal('hide')">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="salvarSistema()">Salvar</button>
            </div>
        </div>
    </div>
</div>

<script>
function novoSistema() {
    $('#sis_id').val('');
    $('#sis_nome, #sis_slug, #sis_descricao, #sis_pasta, #sis_banco, #sis_db_host, #sis_db_usuario, #sis_db_senha').val('');
    $('#modalSistema').modal('show');
}

function editarSistema(id) {
    $.post('?page=sistemas&action=get', {id: id}, function(data) {
        data = JSON.parse(data);
        $('#sis_id').val(data.id);
        $('#sis_nome').val(data.nome);
        $('#sis_slug').val(data.slug);
        $('#sis_descricao').val(data.descricao);
        $('#sis_pasta').val(data.pasta);
        $('#sis_banco').val(data.banco_dados);
        $('#sis_db_host').val(data.db_host);
        $('#sis_db_usuario').val(data.db_usuario);
        $('#sis_db_senha').val(data.db_senha);
        $('#modalSistema').modal('show');
    });
}

function salvarSistema() {
    var dados = $('#formSistema').serialize();
    $.post('?page=sistemas&action=save', dados, function(ret) {
        ret = ret.trim();
        if (ret === 'Salvo com Sucesso') {
            $('#modalSistema').modal('hide');
            location.reload();
        } else {
            alert(ret);
        }
    });
}

function excluirSistema(id) {
    if (confirm('Tem certeza que deseja excluir este sistema?')) {
        $.post('?page=sistemas&action=delete', {id: id}, function(ret) {
            if (ret.trim() === 'Excluído com Sucesso') {
                location.reload();
            } else {
                alert(ret);
            }
        });
    }
}
</script>
